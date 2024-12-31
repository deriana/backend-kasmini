const Report = require("../model/reportModel");
const { successResponse, errorResponse } = require("../providers/response");

const reportTransaction = async (req, res) => {
  const { start_date, end_date } = req.query;

  try {
    Report.reportTransaction(start_date, end_date, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const reportSoldProducts = async (req, res) => {
  const { start_date, end_date } = req.query;

  try {
    Report.reportSoldProducts(start_date, end_date, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const reportStockChanges = async (req, res) => {
  const { start_date, end_date } = req.query;

  try {
    Report.reportStockChanges(start_date, end_date, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const reportExpenses = async (req, res) => {
  const { start_date, end_date } = req.query;

  try {
    Report.reportExpenses(start_date, end_date, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const reportCashiers = async (req, res) => {
  const { start_date, end_date } = req.query;

  try {
    Report.reportCashiers(start_date, end_date, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const reportPaymentMethods = async (req, res) => {
  const { start_date, end_date } = req.query;

  try {
    Report.reportPaymentMethods(start_date, end_date, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const reportCategories = async (req, res) => {
  try {
    Report.reportCategories((err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Report fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching report:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

module.exports = {
  reportTransaction,
  reportSoldProducts,
  reportStockChanges,
  reportExpenses,
  reportCashiers,
  reportPaymentMethods,
  reportCategories,
};
