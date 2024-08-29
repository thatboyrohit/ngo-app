const mongoose = require("mongoose");
const formSchema = mongoose.Schema({
    name : {
        required: true,
        type: String,
        trim: true,
    },
    email : {
        required : true,
        type: String,
        trim: true,
    
    },
  
    location:{
        default : "",
        type : String,
    },
    message:{
        default : "",
        type : String,
    },

});

const  Form = mongoose.model("Form" , formSchema);
module.exports = Form;