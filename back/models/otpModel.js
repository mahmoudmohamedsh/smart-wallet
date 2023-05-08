const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const otpSchema = new Schema({
    otp:{type:String,require:true},
    email:{type:String,require:true},
    createdAt:{type:Date,default:Date.now,index:{expired:300}}    
},{timestamps:true})

module.exports = mongoose.model('Otp',otpSchema);