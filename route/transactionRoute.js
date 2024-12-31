const express = require('express');
const transactionController = require('../controller/transactionController');
const authenticateJWT = require('../middleware/authMiddleware');
const authorizeRoles = require('../middleware/roleMiddleware');

const router = express.Router();

router.post("/transactions",authenticateJWT, transactionController.createTransaction);
router.post("/transactions/confirm",authenticateJWT, transactionController.confirmPayment);

module.exports = router;