const express = require("express");
const reportController = require("../controller/reportController");
const authenticateJWT = require("../middleware/authMiddleware");

const router = express.Router();

router.get("/report/transaction", authenticateJWT, reportController.reportTransaction);
router.get("/report/sold-products", authenticateJWT, reportController.reportSoldProducts);
router.get("/report/stock-changes", authenticateJWT, reportController.reportStockChanges);
router.get("/report/expenses", authenticateJWT, reportController.reportExpenses);
router.get("/report/cashiers", authenticateJWT, reportController.reportCashiers);
router.get("/report/payment-methods", authenticateJWT, reportController.reportPaymentMethods);
router.get("/report/categories", authenticateJWT, reportController.reportCategories);

module.exports = router;