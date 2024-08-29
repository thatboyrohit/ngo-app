const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        trim: true,
    },
    images: [
        {
            type: String,
            required: true,
        }
    ],
    message: {
        type: Number,
        required: true,
    },
   
    category: {
        type: String,
        required: true,
    },
});

const Product = mongoose.model('Product', productSchema);
module.exports = {Product , productSchema} ;  