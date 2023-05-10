const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const requestSchema = new Schema({
    child: {
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
    notes: {
        type: String,
    }
})


const userSchema = new Schema({
    email: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true,
        select: false
    },
    name: {
        type: String,
        required: true
    },
    cash: {
        type: Number,
        default:0,
        required: true
    },
    // if he is child the and its parent ref .
    // if he make a payment he add request with all inf + notes inside its parent ,
    // from ,to , amount , and finally the notes . 
    // if parent accept will add the payment to Payment collection .
    // if parent refuse will delete it .
    isUserChild: {
        isChild: {
            type: Boolean,
            default: false,
        },
        parent:{
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            default:null
        }
    },
    requests: [
        requestSchema
    ],
    childs: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true
        }
    ],
});

module.exports = mongoose.model('User', userSchema);