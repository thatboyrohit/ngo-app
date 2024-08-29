const jwt = require('jsonwebtoken');
const User = require('../models/user');

const admin = async (req , res, next) =>{
    try{

        const token = req.header('x-auth-token');
        if(!token)
        return res.status(401).json({msg : "No auth token, access denied"});
        const verified = jwt.verify(token , 'passwordkey');
        if(!verified)
            return res.status(401).json({msg:"Token verif failed"})
        const user = await User.findById(verified.id);

        if(user.type == 'user'){
            return res.status(401).json({msg : "You are not an admin!"});
        }

        if(!verified) return res.status(401).json({msg: "token verification failed, authorization denied"});

        req.user = verified.id;
        req.token = token;
        next();
    }
    catch(err){
        res.status(500).json({error : err.message});
    }
}
module.exports = admin;