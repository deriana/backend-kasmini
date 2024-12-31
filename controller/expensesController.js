const expenses = require("../model/expensesModel");
const { successResponse, errorResponse } = require("../providers/response");

const createExpense = async (req, res) => {
  const { amount, user_id, description } = req.body;

  if (!amount || !user_id || !description) {
    return res
      .status(400)
      .json(errorResponse({ message: "Data cannot be empty" }));
  }

  try {
    expenses.createExpense(amount, user_id, description);
    expenses.getAllExpense((err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Expense created successfully",
      });
      return res.status(201).json(response);
    });
  } catch (error) {
    console.error("Error creating expense:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getExpense = async (req, res) => {
  const { id_expense } = req.params;

  try {
    expenses.getExpenseById(id_expense, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Expense fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching expense:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getAllExpense = async (req, res) => {
  try {
    expenses.getAllExpense((err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Expense fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching expense:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const updateExpense = async (req, res) => {
  const { id_expense } = req.params;
  const { amount, user_id, description } = req.body;

  if (!amount || !user_id || !description) {
    return res
      .status(400)
      .json(errorResponse({ message: "Data cannot be empty" }));
  }

  try {
    expenses.updateExpense(
      id_expense,
      amount,
      user_id,
      description,
      (err, results) => {
        if (err)
          return res
            .status(500)
            .json(errorResponse({ message: "Server error" }));

        const response = successResponse({
          data: results,
          message: "Expense updated successfully",
        });
        return res.status(200).json(response);
      }
    );
  } catch (error) {
    console.error("Error updating expense:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const deleteExpense = async (req, res) => {
  const { id_expense } = req.params;

  try {
    expenses.deleteExpense(id_expense, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Expense deleted successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error deleting expense:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const createExpenseReport = async (req, res) => {
  const { start_date, end_date } = req.body;

  if (!start_date || !end_date) {
    return res
      .status(400)
      .json(errorResponse({ message: "Start date and End date are required" }));
  }

  try {
    expenses.getExpensesByDateRange(start_date, end_date, (err, results) => {
      if (err) {
        return res
          .status(500)
          .json(
            errorResponse({ message: "Server error while fetching expenses" })
          );
      }

      const totalExpenses = results.reduce(
        (sum, expense) => sum + parseFloat(expense.amount),
        0
      );

      expenses.createExpenseReport(
        start_date,
        end_date,
        totalExpenses,
        (err, report) => {
          if (err) {
            return res
              .status(500)
              .json(
                errorResponse({
                  message: "Server error while creating expense report",
                })
              );
          }

          const response = successResponse({
            data: report,
            message: "Expense report created successfully",
          });
          return res.status(201).json(response);
        }
      );
    });
  } catch (error) {
    console.error("Error creating expense report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getExpenseReportByDate = async (req, res) => {
  const { start_date, end_date } = req.body;

  if (!start_date || !end_date) {
    return res
      .status(400)
      .json(errorResponse({ message: "Start date and End date are required" }));
  }

  try {
    expenses.getExpenseReportByDateRange(
      start_date,
      end_date,
      (err, reports) => {
        if (err) {
          return res
            .status(500)
            .json(errorResponse({ message: "Server error" }));
        }

        const response = successResponse({
          data: reports,
          message: "Expense report fetched successfully",
        });
        return res.status(200).json(response);
      }
    );
  } catch (error) {
    console.error("Error fetching expense report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getExpensesByDateRangeAndUser = async (req, res) => {
  const { start_date, end_date } = req.body;

  if (!start_date || !end_date) {
    return res
      .status(400)
      .json(errorResponse({ message: "Start date and End date are required" }));
  }

  try {
    let startDate = new Date(start_date);
    let endDate = new Date(end_date);

    startDate.setHours(0, 0, 0, 0); 
    endDate.setHours(23, 59, 59, 999); 

    expenses.getExpensesByDateRangeAndUser(
      start_date,
      end_date,
      (err, results) => {
        if (err) {
          return res
            .status(500)
            .json(
              errorResponse({ message: "Server error while fetching expenses" })
            );
        }

        if (results.length === 0) {
          return res
            .status(404)
            .json(
              errorResponse({
                message: "No expenses found for the given date range",
              })
            );
        }

        const response = successResponse({
          data: results,
          message: "Expenses fetched successfully",
        });

        return res.status(200).json(response);
      }
    );
  } catch (error) {
    console.error("Error fetching expenses by date range:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

module.exports = {
  createExpense,
  getAllExpense,
  updateExpense,
  deleteExpense,
  getExpense,
  createExpenseReport,
  getExpenseReportByDate,
  getExpensesByDateRangeAndUser,
};
