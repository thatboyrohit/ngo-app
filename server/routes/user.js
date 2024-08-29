const express = require('express');
const userRouter = express.Router();
const auth = require('../middlewares/auth'); 
const { Product } = require('../models/product'); 
const User = require('../models/user'); 
const Order = require('../models/order'); 
const Form = require("../models/form");




userRouter.post("/api/form" , auth , async(req,res) =>{
    try{
        const {name , email , contact ,location , message} = req.body;
      const usr = await User.findOne({email});
 
     let form = new Form({
      email ,
      name,
      location,
      message

      });
      form = await form.save();
      res.json({form}); 
      
     } catch(e){
          res.status(500).json({error : e.message});
      }  
})
























userRouter.post("/api/order", auth, async (req, res) => {
    try {
        const { productId, totalPrice, userId } = req.body;
            
        const product = await Product.findById(productId);
        
        if (!product) {
            return res.status(400).json({ msg: 'Product not found!' });
        }

        const user = await User.findById(userId);
        if (!user) {
            return res.status(400).json({ msg: 'User not found!' });
        }

        let order = new Order({
            product,
            totalPrice,
            userId: userId,
        });

        order = await order.save();
        res.json(order);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

userRouter.get('/api/order/me' , auth , async(req, res) => {
    try{    
        const orders = await Order.find({ userId: req.user });
        res.json(orders);
    } catch(e){
        res.status(500).json({error : e.message});
    }
})

module.exports = userRouter;
