const express = require('express');
const productController = require('../controller/productController');
const authenticateJWT = require('../middleware/authMiddleware');
const authorizeRoles = require('../middleware/roleMiddleware');

const router = express.Router();

router.post('/products', authenticateJWT, authorizeRoles(['pemilik']), productController.addProduct);
router.get('/products', authenticateJWT, productController.getAllProducts);
router.get('/products/:id_product', authenticateJWT, productController.getProductById);
router.put('/products/:id_product', authenticateJWT, authorizeRoles(['pemilik']), productController.updateProduct);
router.delete('/products/:id_product', authenticateJWT, authorizeRoles(['pemilik']), productController.deleteProduct);

module.exports = router;