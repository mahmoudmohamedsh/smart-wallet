const { validationResult } = require('express-validator');
const bcrypt = require('bcrypt');
const User = require('../models/userModel');
const Otp = require('../models/otpModel');
const PaymentModel = require('../models/paymentModel');
const jwt = require('jsonwebtoken');
const otpGenerator = require('otp-generator');
const userModel = require('../models/userModel');
const paymentModel = require('../models/paymentModel');
require('dotenv/config');


exports.signinVerify = (req, res, next) => {

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const error = new Error('validation faild');
        error.statuscode = 422;
        error.data = errors.array();
        throw error;
    }

    const otp = otpGenerator.generate(6, {
        digits: true, lowerCaseAlphabets: false, upperCaseAlphabets: false, specialChars: false
    });

    console.log(otp);

    const email = req.body.email;
    bcrypt.hash(otp.toString(), 12).then(hashedOtp => {
        const otpNum = new Otp({
            email: email,
            otp: hashedOtp
        });
        return otpNum.save();

    }).then(result => {
        res.status(201).json({ message: 'otp generated successfully !', email: email });
    }).catch(err => {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    })

}

exports.signup = (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const error = new Error('validation faild');
        error.statuscode = 422;
        error.data = errors.array();
        throw error;
    }

    const email = req.body.email;
    const password = req.body.password;
    const name = req.body.name;
    const otp = req.body.otp;

    Otp.find({
        email: email
    }).then(result => {
        if (result.length === 0) {
            const error = new Error('auth faild');
            error.statuscode = 422;
            error.data = errors.array();
            throw error;
        }

        const otpHolder = result[result.length - 1];
        return bcrypt.compare(otp.toString(), otpHolder.toString());


    }).then(result => {
        if (result) {
            const error = new Error('auth faild');
            error.statuscode = 422;
            error.data = errors.array();
            throw error;
        }
        return bcrypt.hash(password.toString(), 12);
    })
        .then(hashedPw => {
            const user = new User({
                email: email,
                password: hashedPw,
                name: name
            });
            return user.save();

        }).then(async (result) => {
            const otpDelete = await Otp.deleteMany({ email: result.email });
            res.status(201).json({ message: 'user created successfully', userId: result._id });
        }).catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })
}

exports.signin = (req, res, next) => {
    const email = req.body.email;
    const password = req.body.password;
    let loadedUser;
    User.findOne({ email: email }).select("+password")
        .then(user => {
            if (!user) {
                const error = new Error('error, check your email and password');
                error.statuscode = 401;
                throw error;
            }
            loadedUser = user;
            return bcrypt.compare(password.toString(), user.password);
        })
        .then(isEqual => {
            if (!isEqual) {
                const error = new Error('error, check your email and password');
                error.statuscode = 401;
                throw error;
            }
            //jwt
            const token = jwt.sign({
                email: loadedUser.email,
                userId: loadedUser._id
            }, process.env.SECRET, { expiresIn: '1h' });
            console.log(process.env.SECRET)
            res.status(200).json({ token: token, userId: loadedUser._id.toString() });
        })
        .catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })
}

exports.addChild = (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const error = new Error('validation faild');
        error.statuscode = 422;
        error.data = errors.array();
        throw error;
    }

    const email = req.body.email;
    const password = req.body.password;
    const name = req.body.name;
    let childId;
    return bcrypt.hash(password.toString(), 12)
        .then(hashedPw => {
            const user = new User({
                email: email,
                password: hashedPw,
                name: name
                , isUserChild: {
                    isChild: true,
                    parent: req.userId
                }
            });
            return user.save();

        }).then((result) => {
            childId = result._id;
            return userModel.findById(req.userId);
        }).then((result) => {
            result.childs.push(childId);
            return result.save();
        }).then((result) => {
            res.status(201).json({ message: 'user created successfully', userId: result._id });
        }).catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })

}

exports.getReq = (req, res, next) => {
    userModel.findById(req.userId)
        .then(result => {
            if (!result) {

                const error = new Error('auth faild');
                error.statuscode = 422;
                error.data = errors.array();
                throw error;

            }
            res.status(200).json({ message: "success", data: result.requests })
        }).catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })
}

exports.getChild = (req, res, next) => {
    userModel.findById(req.userId)
        .then(result => {
            if (!result) {

                const error = new Error('auth faild');
                error.statuscode = 422;
                error.data = errors.array();
                throw error;

            }
            if (result.childs) {
                console.log('empty')
                res.status(200).json({ message: "success 1", data: result.childs })
            }
            else return userModel.find({ '_id': { $in: result.childs } });
        }).then(result => {
            if (result)
                res.status(200).json({ message: "success 2", data: result })
        }).catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })
}

exports.getUserHis = (req, res, next) => {
    paymentModel.find().or([{ toUser: req.userId }, { fromUser: req.userId }])
        .then(result => {
            res.status(200).json({ message: "success", data: result });
        })
        .catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })
}

//note done
exports.handleReq = (req, res, next) => {
    let buyReq;
    userModel.findById(req.userId)
        .then(result => {
            if (!result) {
                const error = new Error('auth faild');
                error.statuscode = 422;
                error.data = errors.array();
                throw error;
            }
            req.body.reqId;
            req.body.isConfirm;
            buyReq = result.requests;
            result.requests.remove(ele => ele._id == req.body.reqId);
            if (req.body.isConfirm)
                res.status(200).json({ message: 'deleted' })

            return result.save();
        }).then(result => {
            paymentModel
        }).catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })

}

exports.getUserData = (req, res, next) => {

    userModel.findById(req.userId)
        .then(result => {
            res.status(200).json({ message: 'success', data: result })
        }).catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        })

}

