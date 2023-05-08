const UserModel = require('../models/userModel');
const paymentModel = require('../models/paymentModel');

exports.pay = (req, res, next) => {
    let currentuser;
    let toUserID;
    UserModel.findOne({ _id: req.userId }).then(userDoc => {
        currentuser = userDoc;
        if (userDoc.isUserChild.isChild) {

        } else {

            return UserModel.findOne({ email: req.body.to });
        }
    }).then(userDoc => {
        toUserID = userDoc._id;
        if (currentuser.cash > req.body.amout) {
            userDoc.cash += req.body.amout;
            return userDoc.save()
        }

    }).then(result => {
        if (currentuser.cash > req.body.amout) {
            currentuser.cash -= req.body.amout;
            return currentuser.save()
        }

    }).then(result => {
        const payment = new paymentModel({
            fromUser: req.userId,
            toUser: toUserID,
            amount: req.body.amount,
        })
        return payment.save()

    }).then(result => {
        res.status(200).json({ message: result })

    }).catch(err => {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err)
    });
}