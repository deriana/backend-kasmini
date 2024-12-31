const db = require("../config/database");

const createTransaction = (
  user_id,
  customer_name,
  payment_method,
  total,
  global_discount,
  tax,
  status,
  callback
) => {
  const query = `
    INSERT INTO transactions (user_id, customer_name, payment_method, total, discount, tax, status)
    VALUES (?, ?, ?, ?, ?, ?, ?)`;
  db.query(
    query,
    [
      user_id,
      customer_name,
      payment_method,
      total,
      global_discount,
      tax,
      status,
    ],
    callback
  );
};

const createTransactionDetail = (
  transaction_id,
  product_id,
  quantity,
  unit_price,
  discount,
  subtotal,
  callback
) => {
  const query = `
    INSERT INTO transaction_details (transaction_id, product_id, quantity, unit_price, discount, subtotal)
    VALUES (?, ?, ?, ?, ?, ?)`;
  db.query(
    query,
    [transaction_id, product_id, quantity, unit_price, discount, subtotal],
    callback
  );
};

const adjustStockForTransaction = (transactionDetails, user_id, callback) => {
  let errorOccurred = false;

  transactionDetails.forEach(({ product_id, quantity }, index) => {
    const updateStockQuery = `UPDATE products SET stock = stock - ? WHERE id_product = ? AND stock >= ?`;
    db.query(updateStockQuery, [quantity, product_id, quantity], (err, result) => {
      if (err || result.affectedRows === 0) {
        errorOccurred = true;
      }

      if (!errorOccurred) {
        const reason = "Product sale"; 
        const insertStockRecordQuery = `
          INSERT INTO stock_records (product_id, user_id, quantity_change, reason)
          VALUES (?, ?, ?, ?)`;
        
        db.query(insertStockRecordQuery, [product_id, user_id, -quantity, reason], (err) => {
          if (err) {
            errorOccurred = true; 
          }

          if (index === transactionDetails.length - 1) {
            callback(errorOccurred ? new Error("Stock adjustment failed") : null);
          }
        });
      } else if (index === transactionDetails.length - 1) {
        callback(new Error("Stock adjustment failed"));
      }
    });
  });
};

const calculateSubtotal = (unit_price, quantity, discount) => {
  if (typeof discount === "string" && discount.includes("%")) {
    const discountPercentage = parseFloat(discount.replace("%", "")) / 100;
    return unit_price * quantity * (1 - discountPercentage);
  }
  return unit_price * quantity - parseFloat(discount);
};

const calculateTransactionTotal = (details, global_discount, tax) => {
  let total = details.reduce((sum, { unit_price, quantity, discount }) => {
    return sum + calculateSubtotal(unit_price, quantity, discount);
  }, 0);

  if (typeof global_discount === "string" && global_discount.includes("%")) {
    const discountPercentage =
      parseFloat(global_discount.replace("%", "")) / 100;
    total *= 1 - discountPercentage;
  } else if (global_discount) {
    total -= parseFloat(global_discount);
  }

  total += parseFloat(tax || 0);

  return total;
};

const confirmPayment = (transaction_id, amount, payment_method, callback) => {
  const getTransactionQuery = `SELECT total FROM transactions WHERE id_transaction = ?`;
  const insertPaymentRecordQuery = `
    INSERT INTO payment_records (transaction_id, amount, payment_method)
    VALUES (?, ?, ?)`;
  const updateTransactionStatusQuery = `
    UPDATE transactions SET status = 'sudah bayar' WHERE id_transaction = ?`;

  db.query(getTransactionQuery, [transaction_id], (err, results) => {
    if (err) return callback(err);

    if (results.length === 0) {
      return callback(new Error("Transaction not found"));
    }

    const total = results[0].total;

    if (amount < total) {
      return callback(new Error("Insufficient payment: Amount is less than total transaction cost"));
    }

    db.query(insertPaymentRecordQuery, [transaction_id, amount, payment_method], (err, result) => {
      if (err) return callback(err);

      db.query(updateTransactionStatusQuery, [transaction_id], (err) => {
        if (err) return callback(err);

        callback(null);
      });
    });
  });
};

const cancelPayment = (transaction_id, callback) => {
  const updateTransactionStatusQuery = `
    UPDATE transactions SET status = 'dibatalkan' WHERE id_transaction = ?`;
  db.query(updateTransactionStatusQuery, [transaction_id], callback);
};

const getTransactionById = (transaction_id, callback) => {
  const query = `
    SELECT 
        t.id_transaction,
        t.transaction_date,
        t.status,
        t.customer_name,
        t.payment_method AS transaction_payment_method,
        t.total AS transaction_total,
        t.discount AS transaction_discount,
        t.tax AS transaction_tax,
        td.id_transaction_detail,
        td.unit_price AS detail_unit_price,
        td.quantity AS detail_quantity,
        td.subtotal AS detail_subtotal,
        td.discount AS detail_discount,
        p.product_name,
        p.price AS product_price,
        p.purchase_price,
        c.category_name,
        pr.payment_date,
        pr.amount AS payment_amount
    FROM 
        transactions t
    LEFT JOIN 
        transaction_details td ON t.id_transaction = td.transaction_id
    LEFT JOIN 
        products p ON td.product_id = p.id_product
    LEFT JOIN 
        categories c ON p.category_id = c.id_category
    LEFT JOIN 
        payment_records pr ON t.id_transaction = pr.transaction_id
    WHERE 
        t.id_transaction = ?;
  `;
  db.query(query, [transaction_id], callback);
};

const updateTransaction = (transaction_id, user_id, customer_name, payment_method, total, global_discount, tax, callback) => {
  const query = `
    UPDATE transactions 
    SET user_id = ?, customer_name = ?, payment_method = ?, total = ?, discount = ?, tax = ? 
    WHERE id_transaction = ?`;
  db.query(query, [user_id, customer_name, payment_method, total, global_discount, tax, transaction_id], callback);
};

const upsertTransactionDetail = (transaction_id, product_id, quantity, unit_price, discount, subtotal, callback) => {
  const query = `
    INSERT INTO transaction_details (transaction_id, product_id, quantity, unit_price, discount, subtotal)
    VALUES (?, ?, ?, ?, ?, ?)
    ON DUPLICATE KEY UPDATE
      quantity = VALUES(quantity),
      unit_price = VALUES(unit_price),
      discount = VALUES(discount),
      subtotal = VALUES(subtotal)`;
  db.query(query, [transaction_id, product_id, quantity, unit_price, discount, subtotal], callback);
};

module.exports = {
  createTransaction,
  createTransactionDetail,
  adjustStockForTransaction,
  calculateSubtotal,
  calculateTransactionTotal,
  confirmPayment,
  cancelPayment,
  getTransactionById,
  updateTransaction,
  upsertTransactionDetail,
};
