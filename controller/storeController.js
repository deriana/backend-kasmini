const Store = require("../model/storeModel");
const { successResponse, errorResponse } = require("../providers/response");

const createStore = async (req, res) => {
    const { store_name, address, phone, email, logo } = req.body;
    
    if (!store_name || !address || !phone || !email || !logo) {
        return res
        .status(400)
        .json(errorResponse({ message: "Data cannot be empty" }));
    }
    
    try {
        Store.createStore(store_name, address, phone, email, logo);
        Store.getStore((err, results) => {
        if (err)
            return res.status(500).json(errorResponse({ message: "Server error" }));
    
        const response = successResponse({
            data: results,
            message: "Store created successfully",
        });
        return res.status(201).json(response);
        });
    } catch (error) {
        console.error("Error creating store:", error);
        return res.status(500).json(errorResponse({ message: error.message }));
    }
}

const getStore = async (req, res) => {
    try {
        Store.getStore((err, results) => {
        if (err)
            return res.status(500).json(errorResponse({ message: "Server error" }));
    
        const response = successResponse({
            data: results,
            message: "Store fetched successfully",
        });
        return res.status(200).json(response);
        });
    } catch (error) {
        console.error("Error fetching store:", error);
        return res.status(500).json(errorResponse({ message: error.message }));
    }
}

const updateStore = async (req, res) => {
    const { id_store } = req.params;
    const { store_name, address, phone, email, logo } = req.body;
    
    if (!store_name || !address || !phone || !email || !logo) {
        return res
        .status(400)
        .json(errorResponse({ message: "Data cannot be empty" }));
    }
    
    try {
        Store.updateStore(id_store, store_name, address, phone, email, logo, (err, results) => {
        if (err)
            return res.status(500).json(errorResponse({ message: "Server error" }));
    
        const response = successResponse({
            data: results,
            message: "Store updated successfully",
        });
        return res.status(200).json(response);
        });
    } catch (error) {
        console.error("Error updating store:", error);
        return res.status(500).json(errorResponse({ message: error.message }));
    }
}

const getStoreById = async (req, res) => {
    const { id_store } = req.params;
    
    try {
        Store.getStoreById(id_store, (err, results) => {
        if (err)
            return res.status(500).json(errorResponse({ message: "Server error" }));
    
        const response = successResponse({
            data: results,
            message: "Store fetched successfully",
        });
        return res.status(200).json(response);
        });
    } catch (error) {
        console.error("Error fetching store:", error);
        return res.status(500).json(errorResponse({ message: error.message }));
    }
}

module.exports = {
    createStore,
    getStore,
    updateStore,
    getStoreById
};