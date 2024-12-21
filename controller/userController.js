const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../model/userModel');
const { successResponse, errorResponse } = require('../providers/response');

// Register User
const registerUser = async (req, res) => {
  const { username, email, password, role, pin } = req.body;

  if (!username || !email || !password || !role || !pin) {
    return res.status(400).json(errorResponse({ message: "Data cannot be empty" }));
  }

  try {
    // Check if email already exists
    User.getUserByEmail(email, (err, results) => {
      if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

      if (results.length > 0) {
        return res.status(400).json(errorResponse({ message: 'Email is already registered, try another email.' }));
      }

      // Encrypt password
      bcrypt.hash(password, 10, (err, hashedPassword) => {
        if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

        // Insert new user into the database
        User.createUser(username, email, hashedPassword, role, pin, (err, results) => {
          if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

          // Fetch all users after the new user is added
          User.getAllUser((err, allUsers) => {
            if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

            const response = successResponse({ data: allUsers, message: 'User registered successfully' });
            return res.status(201).json(response);
          });
        });
      });
    });
  } catch (error) {
    console.error('Error registering user:', error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

// Login User
const loginUser = async (req, res) => {
  const { email, password, pin } = req.body;

  try {
    User.getUserByEmail(email, (err, results) => {
      if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));
      if (results.length === 0) return res.status(400).json(errorResponse({ message: 'Invalid email or password or pin' }));

      const user = results[0];

      bcrypt.compare(password, user.password, (err, isMatch) => {
        if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

        if (!isMatch) {
          return res.status(400).json(errorResponse({ message: 'Invalid email or password pin' }));
        }

        if (pin !== user.pin) {
          return res.status(400).json(errorResponse({ message: 'Invalid email, password, or pin' }));
        }

        const token = jwt.sign({ id_user: user.id_user, role: user.role }, process.env.JWT_SECRET, { expiresIn: '1h' });
        return res.json(successResponse({ data: { token }, message: 'Login successful' }));        
      });
    });
  } catch (error) {
    console.error('Error logging in user:', error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

// Get User by ID
const getUser = async (req, res) => {
  const { id_user } = req.params;

  try {
    User.getUserById(id_user, (err, results) => {
      if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));
      if (results.length === 0) return res.status(404).json(errorResponse({ message: 'User not found' }));

      const response = successResponse({ data: results[0], message: 'User data found' });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error('Error fetching user:', error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

// Update User
const updateUser = async (req, res) => {
  const { id_user } = req.params;
  const { username, email, password, role, pin } = req.body;

  if (!username || !email || !password || !role || !pin) {
    return res.status(400).json(errorResponse({ message: 'Data cannot be empty' }));
  }

  try {
    bcrypt.hash(password, 10, (err, hashedPassword) => {
      if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

      User.updateUser(id_user, username, email, hashedPassword, role, pin, (err, results) => {
        if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

        const response = successResponse({ data: results, message: 'User updated successfully' });
        return res.status(200).json(response);
      });
    });
  } catch (error) {
    console.error('Error updating user:', error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

// Delete User
const deleteUser = async (req, res) => {
  const { id_user } = req.params;

  try {
    User.getUserById(id_user, (err, results) => {
      if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));
      if (results.length === 0) return res.status(404).json(errorResponse({ message: 'User not found' }));

      User.deleteUser(id_user, (err, results) => {
        if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));

        const response = successResponse({ data: results, message: 'User deleted successfully' });
        return res.status(200).json(response);
      });
    });
  } catch (error) {
    console.error('Error deleting user:', error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

module.exports = {
  registerUser,
  loginUser,
  getUser,
  updateUser,
  deleteUser,
};
