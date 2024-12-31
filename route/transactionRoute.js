const express = require('express');
const transactionController = require('../controller/transactionController');
const authenticateJWT = require('../middleware/authMiddleware');
const authorizeRoles = require('../middleware/roleMiddleware');

const router = express.Router();

router.post("/transactions",authenticateJWT, transactionController.createTransaction);
router.post("/transactions/confirm",authenticateJWT, transactionController.confirmPayment);
router.put("/transactions/cancel/:transaction_id",authenticateJWT, transactionController.cancelPayment);
router.get("/transactions/:transaction_id",authenticateJWT, transactionController.getPaymentById);
router.put("/transactions/edit/:transaction_id",authenticateJWT, transactionController.updateTransaction);

module.exports = router;    