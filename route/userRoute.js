const express = require("express");
const userController = require("../controller/userController");
const authenticateJWT = require("../middleware/authMiddleware");
const authorizeRoles = require("../middleware/roleMiddleware");

const router = express.Router();

router.post("/users/register", userController.registerUser);
router.post("/users/login", userController.loginUser);
router.get("/users/:id_user", authenticateJWT, userController.getUser);
router.put("/users/:id_user", authenticateJWT, authorizeRoles(["pemilik"]),userController.updateUser);
router.delete("/users/:id_user", authenticateJWT, authorizeRoles(["pemilik"]),userController.deleteUser
);

module.exports = router;
