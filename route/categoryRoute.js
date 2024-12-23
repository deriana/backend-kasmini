const express = require('express');
const categoryController = require('../controller/categoryController');
const authenticateJWT = require('../middleware/authMiddleware');
const authorizeRoles = require('../middleware/roleMiddleware');

const router = express.Router();

router.post('/categories', authenticateJWT, authorizeRoles(['pemilik']), categoryController.createCategory);
router.get('/categories', authenticateJWT, categoryController.getAllCategory);
router.get('/categories/:id_category', authenticateJWT, categoryController.getCategory);
router.put('/categories/:id_category', authenticateJWT, authorizeRoles(['pemilik']), categoryController.updateCategory);
router.delete('/categories/:id_category', authenticateJWT, authorizeRoles(['pemilik']), categoryController.deleteCategory);

module.exports = router;