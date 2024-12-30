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

const checkDuplicateProduct = (product_name, callback) => {
  const query = "SELECT * FROM products WHERE product_name = ?";
  db.query(query, [product_name], (error, results) => {
    if (error) {
      return callback(error);
    }
    callback(null, results.length > 0);
  });
};

const addProduct = (
  product_name,
  price,
  purchase_price,
  stock,
  unit,
  category_id,
  image,
  callback
) => {
  checkDuplicateProduct(product_name, (error, isDuplicate) => {
    if (error) {
      return callback(error);
    }

    if (isDuplicate) {
      return callback(new Error("Produk dengan nama yang sama sudah ada"));
    }

    const query = `INSERT INTO products (product_name, price, purchase_price, stock, unit, category_id, image, created_at)
                   VALUES (?, ?, ?, ?, ?, ?, ?, NOW())`;

    db.query(
      query,
      [product_name, price, purchase_price, stock, unit, category_id, image],
      (error, results) => {
        if (error) {
          return callback(error);
        }
        callback(null, results.insertId);
      }
    );
  });
};

const adjustProductStock = (product_id, user_id, quantity_change, reason, callback = () => {}) => {
  if (typeof callback !== "function") {
    throw new Error("Callback must be a function");
  }

  const checkStockQuery = `SELECT stock FROM products WHERE id_product = ?`;
  const updateStockQuery = `UPDATE products SET stock = stock + ? WHERE id_product = ?`;
  const insertStockRecordQuery = `
    INSERT INTO stock_records (product_id, user_id, quantity_change, reason)
    VALUES (?, ?, ?, ?)`;

  db.query(checkStockQuery, [product_id], (err, results) => {
    if (err) return callback(err);
    if (results.length === 0) return callback(new Error("Product not found"));

    const currentStock = results[0].stock;
    const newStock = currentStock + quantity_change;

    if (newStock < 0) {
      return callback(new Error("Stock cannot go below zero"));
    }

    db.query(updateStockQuery, [quantity_change, product_id], (err) => {
      if (err) return callback(err);

      db.query(insertStockRecordQuery, [product_id, user_id, quantity_change, reason], (err) => {
        if (err) return callback(err);

        callback(null); // Berhasil
      });
    });
  });
};


module.exports = {
  createProduct,
  getAllProduct,
  getProductById,
  updateProduct,
  deleteProduct,
  addProduct,
  checkDuplicateProduct,
  adjustProductStock
};
