const db = require("../config/database");

const createStore = (store_name, address, phone, email, logo) => {
    const query = `INSERT INTO store_settings (store_name, address, phone, email, logo) VALUES (?, ?, ?, ?, ?)`;
    db.query(query, [store_name, address, phone, email, logo]);
}

const getStore = (callback) => {
    const query = "SELECT * FROM store_settings";
    db.query(query, callback);
};

const getStoreById = (id_store, callback) => {
    const query = "SELECT * FROM store_settings WHERE id_store = ?";
    db.query(query, [id_store], callback);
}

const updateStore = (id_store, store_name, address, phone, email, logo, callback) => {
    const query = `UPDATE store_settings SET store_name = ?, address = ?, phone = ?, email = ?, logo = ? WHERE id_store = ?`;
    db.query(query, [store_name, address, phone, email, logo, id_store], callback);
}

module.exports = {
    createStore,
    getStore,
    getStoreById,
    updateStore
};