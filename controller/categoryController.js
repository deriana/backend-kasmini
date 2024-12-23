const Category = require("../model/categoryModel");
const { successResponse, errorResponse } = require("../providers/response");

const createCategory = async (req, res) => {
  const { category_name, category_desc } = req.body;

  if (!category_name || !category_desc) {
    return res
      .status(400)
      .json(errorResponse({ message: "Data cannot be empty" }));
  }

  try {
    Category.createCategory(category_name, category_desc);
    Category.getAllCategory((err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Category created successfully",
      });
      return res.status(201).json(response);
    });
  } catch (error) {
    console.error("Error creating category:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getAllCategory = async (req, res) => {
  try {
    Category.getAllCategory((err, results) => {
      if (err)
        return res.status(500).json(errorResponse({ message: "Server error" }));

      const response = successResponse({
        data: results,
        message: "Category fetched successfully",
      });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error("Error fetching category:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const updateCategory = async (req, res) => {
  const { id_category } = req.params;
  const { category_name, category_desc } = req.body;

  if (!category_name || !category_desc) {
    return res
      .status(400)
      .json(errorResponse({ message: "Data cannot be empty" }));
  }

  try {
    Category.updateCategory(
      id_category,
      category_name,
      category_desc,
      (err, results) => {
        if (err)
          return res
            .status(500)
            .json(errorResponse({ message: "Server error" }));

        const response = successResponse({
          data: results,
          message: "Category updated successfully",
        });
        return res.status(200).json(response);
      }
    );
  } catch (error) {
    console.error("Error updating category:", error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const getCategory = async (req, res) => {
  const { id_category } = req.params;

  try {
    Category.getCategoryById(id_category, (err, results) => {
      if (err) return res.status(500).json(errorResponse({ message: 'Server error' }));
      if (results.length === 0) return res.status(404).json(errorResponse({ message: 'Category not found' }));

      const response = successResponse({ data: results[0], message: 'Category data found' });
      return res.status(200).json(response);
    });
  } catch (error) {
    console.error('Error fetching category:', error);
    return res.status(500).json(errorResponse({ message: error.message }));
  }
};

const deleteCategory = async (req, res) => {
  const {id_category} = req.params;

  try {
    Category.getCategoryById(id_category, (err, results) => {
      if (err) return res.status(500).json(errorResponse({message: "Server error"}))
      if (results.length === 0) return res.status(404).json(errorResponse({message: "Category Not Found"}));

      Category.deleteCategory(id_category, (err, results) => {
        if (err) return res.status(500).json(errorResponse({message: "Category found"}))
        
        const response = successResponse({data: results, message: "Category deleted succesfully"});
        return res.status(200).json(response);
      })
      })
  } catch(error) {
    console.error('Error deleting categories:'. error);
    return res.status(500).json(errorResponse({message: error.message}))
  }
}

module.exports = {
  createCategory,
  getAllCategory,
  updateCategory,
  getCategory,
  deleteCategory
};
