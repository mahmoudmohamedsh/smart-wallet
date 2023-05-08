const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const userSchema = new Schema({
    email: {
        type:String,
        required:true
    },
    password: {
        type:String,
        required:true
    },
    name: {
        type:String,
        required:true
    },
    cash: {
        type: Number,
        required: true
    },
    isUserChild :{
        type:Boolean,
        default:false,
    },
    childs:[
         {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
      }
    ],
});

module.exports = mongoose.model('User',userSchema);