const express = require("express");
const paymentController = require('../controllers/paymentController');
const router = express.Router();
const isAuth = require('../middleware/is-auth')
// /payment/
router.post('/',isAuth,paymentController.pay);


module.exports = router;