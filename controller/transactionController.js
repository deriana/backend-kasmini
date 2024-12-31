const transactions = require("../model/transactionModel");
const { successResponse, errorResponse } = require("../providers/response");

const createTransaction = (req, res) => {
  const {
    user_id,
    customer_name,
    payment_method,
    global_discount,
    tax,
    details,
  } = req.body;

  const total = transactions.calculateTransactionTotal(
    details,
    global_discount,
    tax
  );

  transactions.createTransaction(
    user_id,
    customer_name,
    payment_method,
    total,
    global_discount,
    tax,
    "belum bayar",
    (err, transactionResult) => {
      if (err) return res.status(500).json({ error: err.message });

      const transaction_id = transactionResult.insertId;

      const detailPromises = details.map(
        ({ product_id, unit_price, quantity, discount }) => {
          const subtotal = transactions.calculateSubtotal(
            unit_price,
            quantity,
            discount
          );
          return new Promise((resolve, reject) => {
            transactions.createTransactionDetail(
              transaction_id,
              product_id,
              quantity,
              unit_price,
              discount,
              subtotal,
              (err) => {
                if (err) reject(err);
                else resolve();
              }
            );
          });
        }
      );

      Promise.all(detailPromises)
        .then(() => {
          transactions.adjustStockForTransaction(details, user_id, (err) => {
            if (err)
              return res
                .status(500)
                .json({ error: "Failed to adjust stock: " + err.message });
            res
              .status(201)
              .json({
                message: "Transaction created and stock updated successfully",
                transaction_id,
              });
          });
        })
        .catch((err) =>
          res
            .status(500)
            .json({
              error: "Failed to create transaction details: " + err.message,
            })
        );
    }
  );
};
const confirmPayment = async (req, res) => {
  const { transaction_id, amount, payment_method } = req.body;

  if (!transaction_id || !amount || !payment_method) {
    return res.status(400).json(
      errorResponse({
        message: "Missing required fields: transaction_id, amount, or payment_method",
      })
    );
  }

  try {
    transactions.confirmPayment(transaction_id, amount, payment_method, (err) => {
      if (err) {
        if (err.message.includes("Insufficient payment")) {
          return res.status(400).json(
            errorResponse({
              message: "Insufficient payment: Amount is less than total transaction cost",
            })
          );
        }
        
        return res.status(500).json(
          errorResponse({ message: "Failed to confirm payment", error: err.message })
        );
      }

      const response = successResponse({
        message: "Payment confirmed and transaction updated successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    return res.status(500).json(errorResponse({ message: "Server error", error: error.message }));
  }
};


module.exports = {
  createTransaction,
  confirmPayment
};
