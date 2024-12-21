const db = require('../config/database');

const createUser = (username, email, password, role, pin, callback) => {
  const query = `INSERT INTO users (username, email, password, role, pin, created_at) 
                 VALUES (?, ?, ?, ?, ?, NOW())`;
  db.query(query, [username, email, password, role, pin], callback);
};

const getAllUser = (callback) => {
  const query = 'SELECT * FROM users';
  db.query(query, callback);
}

const getUserById = (id_user, callback) => {
  const query = 'SELECT * FROM users WHERE id_user = ?';
  db.query(query, [id_user], callback);
};

const getUserByEmail = (email, callback) => {
  const query = 'SELECT * FROM users WHERE email = ?';
  db.query(query, [email], callback);
};

const updateUser = (id_user, username, email, password, role, pin, callback) => {
  const query = `UPDATE users SET username = ?, email = ?, password = ?, role = ?, pin = ?
                 WHERE id_user = ?`;
  db.query(query, [username, email, password, role, pin, id_user], callback);
};

const deleteUser = (id_user, callback) => {
  const query = 'DELETE FROM users WHERE id_user = ?';
  db.query(query, [id_user], callback);
};

module.exports = {
  createUser,
  getUserById,
  getUserByEmail,
  updateUser,
  deleteUser,
  getAllUser
};
