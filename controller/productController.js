const Product = require("../model/productModel");
const { successResponse, errorResponse } = require("../providers/response");

const getProductById = async (req, res) => {
  const { id_product } = req.params;

  try {
    Product.getProductById(id_product, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      if (results.length === 0)
        return res
          .status(404)
          .json(errorResponse({ message: "Product not found" }));

      const response = successResponse({
        data: results[0],
        message: "Product retrieved successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error retrieving product:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getAllProducts = async (req, res) => {
  try {
    Product.getAllProduct((err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Products retrieved successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error retrieving products:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const addProduct = async (req, res) => {
  const { product_name, price, purchase_price, stock, unit, category_id, image } = req.body;

  try {
    Product.addProduct(product_name, price, purchase_price, stock, unit, category_id, image, (err, productId) => {
      if (err) {
        return res.status(500).json(errorResponse({ message: err.message }));
      }

      const response = successResponse({
        message: "Product added successfully",
        data: { id_product: productId },
      });
      return res.status(201).json(response);
    });
  } catch (error) {
    console.error("Error adding product:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const updateProduct = async (req, res) => {
  const { id_product } = req.params;
  const { product_name, price, stock, category_id, image } = req.body;

  try {
    Product.updateProduct(
      id_product,
      product_name,
      price,
      stock,
      category_id,
      image,
      (err, results) => {
        if (err)
          return res
            .status(500)
            .json(errorResponse({ message: "Server error" }));

        if (results.affectedRows === 0)
          return res
            .status(404)
            .json(errorResponse({ message: "Product not found" }));

        const response = successResponse({
          message: "Product updated successfully",
        });
        return res.status(200).json(response);
      }
    );
  } catch (error) {
    console.error("Error updating product:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

// Controller to delete a product
const deleteProduct = async (req, res) => {
  const { id_product } = req.params;

  try {
    Product.deleteProduct(id_product, (err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      if (results.affectedRows === 0)
        return res
          .status(404)
          .json(errorResponse({ message: "Product not found" }));

      const response = successResponse({
        message: "Product deleted successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error deleting product:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const adjustProductStock = async (req, res) => {
  const { product_id, user_id, quantity_change, reason } = req.body;

  if (!product_id || !user_id || !quantity_change || !reason) {
    return res
      .status(400)
      .json(errorResponse({ message: "Data cannot be empty" }));
  }

  try {
    Product.adjustProductStock(product_id, user_id, quantity_change, reason);
    Product.getAllProduct((err, results) => {
      if (err) {
        return res
          .status(500)
          .json(errorResponse({ message: "Failed to fetch updated products" }));
      }

      const response = successResponse({
        data: results,
        message: "Stock adjusted successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error adjusting stock:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};


module.exports = {
  getProductById,
  getAllProducts,
  addProduct,
  updateProduct,
  deleteProduct,
  adjustProductStock
};
