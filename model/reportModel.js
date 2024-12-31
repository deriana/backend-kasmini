const db = require("../config/database");

const reportTransaction = (start_date, end_date, callback) => {
  const query = `SELECT 
            t.id_transaction,
            t.transaction_date,
            t.customer_name,
            t.payment_method,
            t.total,
            t.discount,
            t.tax,
            t.status,
            u.username AS cashier
        FROM transactions t
        JOIN users u ON t.user_id = u.id_user
        WHERE t.transaction_date BETWEEN ? AND ?
        ORDER BY t.transaction_date DESC;
        `;
  db.query(query, [start_date, end_date], callback);
};

const reportSoldProducts = (start_date, end_date, callback) => {
  const query = `SELECT 
              td.product_id,
              p.product_name,
              SUM(td.quantity) AS total_sold,
              SUM(td.subtotal - td.discount) AS revenue
          FROM transaction_details td
          JOIN products p ON td.product_id = p.id_product
          JOIN transactions t ON td.transaction_id = t.id_transaction
          WHERE t.transaction_date BETWEEN ? AND ? 
          AND t.status = 'sudah bayar'
          GROUP BY td.product_id, p.product_name
          ORDER BY total_sold DESC;
          `;
  db.query(query, [start_date, end_date], callback);
};

const reportStockChanges = (start_date, end_date, callback) => {
  const query = `SELECT 
              sr.id_stock_record,
              sr.date,
              p.product_name,
              sr.quantity_change,
              sr.reason,
              u.username AS updated_by
          FROM stock_records sr
          JOIN products p ON sr.product_id = p.id_product
          JOIN users u ON sr.user_id = u.id_user
          WHERE sr.date BETWEEN ? AND ?
          ORDER BY sr.date DESC;
          `;
  db.query(query, [start_date, end_date], callback);
};

const reportExpenses = (start_date, end_date, callback) => {
  const query = `SELECT 
              e.id_expense,
              e.amount,
              e.description,
              e.date,
              u.username AS created_by
          FROM expenses e
          JOIN users u ON e.user_id = u.id_user
          WHERE e.date BETWEEN ? AND ?
          ORDER BY e.date DESC;
          `;
  db.query(query, [start_date, end_date], callback);
};

const reportCashiers = (start_date, end_date, callback) => {
  const query = `SELECT 
              u.id_user,
              u.username,
              u.email,
              COUNT(t.id_transaction) AS total_transactions,
              SUM(t.total) AS total_sales
          FROM users u
          LEFT JOIN transactions t ON u.id_user = t.user_id
          WHERE t.transaction_date BETWEEN ? AND ?
          GROUP BY u.id_user, u.username, u.email
          ORDER BY total_sales DESC;
          `;
  db.query(query, [start_date, end_date], callback);
};

const reportCategories = (callback) => {
  const query = `SELECT 
              c.id_category,
              c.category_name,
              c.category_description,
              COUNT(p.id_product) AS total_products
          FROM categories c
          LEFT JOIN products p ON c.id_category = p.category_id
          GROUP BY c.id_category, c.category_name, c.category_description
          ORDER BY c.category_name;
          `;
  db.query(query, [], callback);
};

const reportPaymentMethods = (start_date, end_date, callback) => {
  const query = `SELECT 
              t.payment_method,
              COUNT(t.id_transaction) AS total_transactions,
              SUM(t.total) AS total_revenue
          FROM transactions t
          WHERE t.transaction_date BETWEEN ? AND ?
          GROUP BY t.payment_method
          ORDER BY total_revenue DESC;
          `;
  db.query(query, [start_date, end_date], callback);
};

module.exports = {
  reportTransaction,
  reportSoldProducts,
  reportStockChanges,
  reportCategories,
  reportExpenses,
  reportCashiers,
  reportPaymentMethods,
};
