const db = require("../config/database");

const createExpense = (amount, user_id, description) => {
  const query = `INSERT INTO expenses (amount, user_id, description, date) VALUES (?, ?, ?, NOW())`;
  db.query(query, [amount, user_id, description]);
};

const getAllExpense = (callback) => {
  const query = `
      SELECT e.id_expense, e.amount, e.description, e.date, e.user_id, u.username
      FROM expenses e
      INNER JOIN users u ON e.user_id = u.id_user`;
  db.query(query, callback);
};

const getExpenseById = (id_expense, callback) => {
  const query = `
      SELECT e.id_expense, e.amount, e.description, e.date, e.user_id, u.username
      FROM expenses e
      INNER JOIN users u ON e.user_id = u.id_user
      WHERE e.id_expense = ?`;
  db.query(query, [id_expense], callback);
};

const updateExpense = (id_expense, amount, user_id, description, callback) => {
  const query = `UPDATE expenses SET amount = ?, user_id = ?, description = ? WHERE id_expense = ?`;
  db.query(query, [amount, user_id, description, id_expense], callback);
};

const deleteExpense = (id_expense, callback) => {
  const query = "DELETE FROM expenses WHERE id_expense = ?";
  db.query(query, [id_expense], callback);
};

const getExpensesByDateRangeAndUser = (startDate, endDate, callback) => {
  const query = `
        SELECT 
            e.id_expense, 
            e.amount, 
            e.description, 
            e.date, 
            u.id_user, 
            u.username, 
            u.email,
            (SELECT SUM(amount) FROM expenses WHERE date BETWEEN ? AND ?) AS total_expenses
        FROM 
            expenses e
        JOIN 
            users u ON e.user_id = u.id_user
        WHERE 
            e.date BETWEEN ? AND ?
        ORDER BY 
            e.date DESC;
    `;

  db.query(query, [startDate, endDate, startDate, endDate], (err, results) => {
    if (err) {
      console.error("Error executing query:", err);
      return callback(err, null);
    }
    callback(null, results);
  });
};

const getExpenseReportByDateRange = (startDate, endDate, callback) => {
  const query = `
        SELECT 
            er.id_expense_report, 
            er.start_date, 
            er.end_date, 
            er.total_expenses
        FROM expense_reports er
        WHERE er.start_date >= ? AND er.end_date <= ?`;
  db.query(query, [startDate, endDate], callback);
};

const getExpensesByDateRange = (startDate, endDate, callback) => {
  const query = `
        SELECT e.id_expense, e.amount, e.user_id, e.description, e.date
        FROM expenses e
        WHERE e.date >= ? AND e.date <= ?`;

  db.query(query, [startDate, endDate], callback);
};

const getExpenseReportById = (id_expense_report, callback) => {
  const query = `
        SELECT 
            er.id_expense_report, 
            er.start_date, 
            er.end_date, 
            er.total_expenses
        FROM expense_reports er
        WHERE er.id_expense_report = ?`;

  db.query(query, [id_expense_report], callback);
};

const updateExpenseReportWithTotal = (
  id_expense_report,
  totalExpenses,
  callback
) => {
  const query = `
        UPDATE expense_reports
        SET total_expenses = ?
        WHERE id_expense_report = ?`;
  db.query(query, [totalExpenses, id_expense_report], callback);
};

const createExpenseReport = (startDate, endDate, totalExpenses, callback) => {
  const query = `
        INSERT INTO expense_reports (start_date, end_date, total_expenses)
        VALUES (?, ?, ?)`;

  db.query(query, [startDate, endDate, totalExpenses], callback);
};

module.exports = {
  createExpense,
  getAllExpense,
  getExpenseById,
  updateExpense,
  deleteExpense,
  getExpenseReportByDateRange,
  getExpensesByDateRange,
  getExpenseReportById,
  updateExpenseReportWithTotal,
  createExpenseReport,
  getExpensesByDateRangeAndUser,
};
