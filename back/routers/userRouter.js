const express = require("express");
const userController = require('../controllers/userController');
const router = express.Router();
const { check, validationResult } = require('express-validator');
const UserModel = require('../models/userModel');
const isAuth = require('../middleware/is-auth')
///auth/signupVerify
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
///auth/signup
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
///auth/signin
router.post('/signin', userController.signin);
//auth/getReq
router.post('/getReq',isAuth, userController.getReq);
//auth/getChild
router.post('/getChild',isAuth, userController.getChild);
//auth/gethis
router.post('/getHis',isAuth, userController.getUserHis);
//auth/addChild
router.post('/addChild', isAuth,[
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
],userController.addChild);
//auth/getUser
router.post('/getUser', isAuth,userController.getUserData);

module.exports = router;