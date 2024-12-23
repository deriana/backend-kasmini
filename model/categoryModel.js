const db = require("../config/database");

const createCategory = (category_name, category_desc) => {
  const query = `INSERT INTO categories (category_name, category_description, created_at) VALUES (?, ?, NOW())`;
  db.query(query, [category_name, category_desc]);
};

const getAllCategory = (callback) => {
  const query = "SELECT * FROM categories";
  db.query(query, callback);
};

const getCategoryById = (id_category, callback) => {
  const query = "SELECT * FROM categories WHERE id_category = ?";
  db.query(query, [id_category], callback);
};

const updateCategory = (
  id_category,
  category_name,
  category_desc,
  callback
) => {
  const query = `UPDATE categories SET category_name = ?, category_description = ? WHERE id_category = ?`;
  db.query(query, [category_name, category_desc, id_category], callback);
};

const deleteCategory = (id_category, callback) => {
  const query = "DELETE FROM categories WHERE id_category = ?";
  db.query(query, [id_category], callback);
};

module.exports = {
  createCategory,
  getAllCategory,
  getCategoryById,
  updateCategory,
  deleteCategory,
};
