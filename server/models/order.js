const mongoose = require("mongoose");
const {productSchema} = require('./product');

const orderSchema = mongoose.Schema({
    product: {
        type: productSchema, 
        required: true,
    },
    totalPrice: {
        type: Number,
        required: true,
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User',
    },
    orderedAt: {
        type: Date,
        default: Date.now,
    },
    status: {
        type: Number,
        default: 0, 
    },
});

const Order = mongoose.model('Order', orderSchema);
module.exports = Order;
