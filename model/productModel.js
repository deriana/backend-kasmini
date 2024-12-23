const db = require("../config/database");

const createProduct = (product_name, price, stock, category_id, image) => {
  const query = `INSERT INTO products (product_name, price, stock, category_id, image, created_at) VALUES (?, ?, ?, ?, ?, NOW())`;
  db.query(query, [product_name, price, stock, category_id, image]);
};

const getAllProduct = (callback) => {
  const query = "SELECT * FROM products";
  db.query(query, callback);
};

const getProductById = (id_product, callback) => {
  const query = "SELECT * FROM products WHERE id_product = ?";
  db.query(query, [id_product], callback);
};

const updateProduct = (
  id_product,
  product_name,
  price,
  stock,
  category_id,
  image,
  callback
) => {
  const query = `UPDATE products SET product_name = ?, price = ?, stock = ?, category_id = ?, image = ?
                   WHERE id_product = ?`;
  db.query(
    query,
    [product_name, price, stock, category_id, image, id_product],
    callback
  );
};

const deleteProduct = (id_product, callback) => {
  const query = "DELETE FROM products WHERE id_product = ?";
  db.query(query, [id_product], callback);
};

module.exports = {
  createProduct,
  getAllProduct,
  getProductById,
  updateProduct,
  deleteProduct,
};
