const express = require("express");
const paymentController = require('../controllers/paymentController');
const router = express.Router();
const isAuth = require('../middleware/is-auth')
const isChild = require('../middleware/is-child')
// /payment/
router.post('/',isAuth,isChild,paymentController.pay)