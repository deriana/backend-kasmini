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

  // Iterasi setiap detail transaksi
  transactionDetails.forEach(({ product_id, quantity }, index) => {
    // Update stok produk di tabel products
    const updateStockQuery = `UPDATE products SET stock = stock - ? WHERE id_product = ? AND stock >= ?`;
    db.query(updateStockQuery, [quantity, product_id, quantity], (err, result) => {
      if (err || result.affectedRows === 0) {
        errorOccurred = true; // Jika ada error saat update stok
      }

      if (!errorOccurred) {
        // Menambahkan perubahan stok ke tabel stock_records
        const reason = "Product sale"; // Alasan perubahan stok
        const insertStockRecordQuery = `
          INSERT INTO stock_records (product_id, user_id, quantity_change, reason)
          VALUES (?, ?, ?, ?)`;
        
        // Menambahkan data perubahan stok
        db.query(insertStockRecordQuery, [product_id, user_id, -quantity, reason], (err) => {
          if (err) {
            errorOccurred = true; // Jika ada error saat insert ke stock_records
          }

          // Jika proses untuk semua detail transaksi sudah selesai, panggil callback
          if (index === transactionDetails.length - 1) {
            callback(errorOccurred ? new Error("Stock adjustment failed") : null);
          }
        });
      } else if (index === transactionDetails.length - 1) {
        // Jika ada error, kirimkan ke callback
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

module.exports = {
  createTransaction,
  createTransactionDetail,
  adjustStockForTransaction,
  calculateSubtotal,
  calculateTransactionTotal,
};
