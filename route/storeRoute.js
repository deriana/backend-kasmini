const express = require('express');
const storeController = require('../controller/storeController');
const authenticateJWT = require('../middleware/authMiddleware');
const authorizeRoles = require('../middleware/roleMiddleware');

const router = express.Router();

router.post('/store', authenticateJWT, authorizeRoles(['pemilik']), storeController.createStore);
router.get('/store', authenticateJWT, storeController.getStore);
router.get('/store/:id_store', authenticateJWT, storeController.getStoreById);
router.put('/store/:id_store', authenticateJWT, authorizeRoles(['pemilik']), storeController.updateStore);

module.exports = router;