const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const paymentSchema = new Schema({
    fromUser: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
      required: true
    },
    toUser: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
      required: true
    },
    amount: {
      type: Number,
      required: true
    },
    date: {
      type: Date,
      default: Date.now
    }
  });
  
  module.exports = mongoose.model('Payment',paymentSchema);