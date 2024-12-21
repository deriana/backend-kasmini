const express = require('express');
const userController = require('../controller/userController');
const authenticateJWT = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/users/register', userController.registerUser);
router.post('/users/login', userController.loginUser);
router.get('/users/:id_user', authenticateJWT, userController.getUser);
router.put('/users/:id_user', authenticateJWT, userController.updateUser);
router.delete('/users/:id_user', authenticateJWT, userController.deleteUser);

module.exports = router;
