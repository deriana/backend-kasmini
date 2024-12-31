const express = require('express');
const expensesController = require('../controller/expensesController');
const authenticateJWT = require('../middleware/authMiddleware');
const authorizeRoles = require('../middleware/roleMiddleware');
const e = require('express');

const router = express.Router();

router.post('/expenses', authenticateJWT, authorizeRoles(['pemilik']), expensesController.createExpense);
router.get('/expenses', authenticateJWT, expensesController.getAllExpense);
router.get('/expenses/:id_expense', authenticateJWT, expensesController.getExpense);
router.put('/expenses/:id_expense', authenticateJWT, authorizeRoles(['pemilik']), expensesController.updateExpense);
router.delete('/expenses/:id_expense', authenticateJWT, authorizeRoles(['pemilik']), expensesController.deleteExpense);
router.post('/expenses/reports', authenticateJWT, expensesController.createExpenseReport);
router.get('/expenses/reports', authenticateJWT, expensesController.getExpenseReportByDate);
router.post('/expenses/reports/range', authenticateJWT, expensesController.getExpensesByDateRangeAndUser);

module.exports = router;   