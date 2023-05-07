const express = require("express");
const userController = require('../controllers/userController');
const router = express.Router();
const { check, validationResult } = require('express-validator');
const UserModel = require('../models/userModel');

router.post('/signupVerify',[
    check('email')
    .notEmpty()
    .withMessage('please enter a valid email.')
    .custom((value,{req})=>{
        return UserModel.findOne({email:value}).then(userDoc=>{
                
            if(userDoc){//user already exist 
                console.log('eror')
                return Promise.reject("email already exist");
            }
        })
    }).normalizeEmail()
    ],userController.signinVerify)

router.post('/signup', [
    check('email').notEmpty().withMessage('please enter a valid email.')
    .custom((value,{req})=>{
        return UserModel.findOne({email:value}).then(userDoc=>{
                
            if(userDoc){//user already exist 
                console.log('eror')
                return Promise.reject("email already exist");
            }
        })
    }).normalizeEmail()
    ,
    check('password').isLength({min:5}),
    check('name').not().isEmpty()
], userController.signup);


router.post('/signin', userController.signin);


module.exports = router;