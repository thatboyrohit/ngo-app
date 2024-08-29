const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Product } = require('../models/product');
const Order = require('../models/order');
//Add product
adminRouter.post('/admin/add-product' , admin , async (req ,res) =>{
    try{
       
        const {name , description , images , quantity , price , category} = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product = await product.save();
        res.json(product);

    } catch(e){
        res.status(500).json({error : e.message});
    }
});

//Get all posts
adminRouter.get('/admin/get-products' ,admin, async (req , res) =>{
    try{
        const products = await Product.find({});
        res.json(products);
    }
    catch(e){
        res.status(500).json({error : e.message});
    }
});

//dlt prdct
adminRouter.post('/admin/delete-product',admin,async(req ,res)=>{
    try{
        const{id} = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
    } catch(e){
        res.status(500).json({error : e.message});
    }
});

adminRouter.get('/admin/get-orders' , admin , async(req,res) =>{
  try{
    const orders = await Order.find({});
    res.json(orders);
  } catch(e){
    res.status(500).json({error:e.message});
  }
})
module.exports = adminRouter;