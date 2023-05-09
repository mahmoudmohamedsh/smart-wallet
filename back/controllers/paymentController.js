const UserModel = require('../models/userModel');
const paymentModel = require('../models/paymentModel');

exports.pay = (req, res, next) => {
    let currentuser;
    let toUserID;
    UserModel.findOne({ _id: req.userId }).then(userDoc => {
        currentuser = userDoc;
        return UserModel.findOne({ email: req.body.to });

    }).then(userDoc => {
        toUserID = userDoc;
        if (currentuser.cash >= req.body.amount && !currentuser.isUserChild.isChild) {
            cash = userDoc.cash + req.body.amount;
            userDoc.cash = cash;
            return userDoc.save();
        } else {
            return null;
        }

    }).then(result => {
        if (!currentuser.isUserChild.isChild) {
            if (currentuser.cash >= req.body.amount) {
                cash = currentuser.cash - req.body.amount;
                currentuser.cash = cash;
                return currentuser.save()
            } else {
                const error = new Error("");
            }
        } else {
            return UserModel.findById({ _id: currentuser.isUserChild.parent })
        }

    }).then(result => {
        // 
        if (!currentuser.isUserChild.isChild) {
            const payment = new paymentModel({
                fromUser: req.userId,
                toUser: toUserID,
                amount: req.body.amount,
            })
            return payment.save()
        } else { //parent in result

            result.requests.push({
                child: currentuser._id,
                toUser: toUserID._id,
                amount: req.body.amount,
                notes: req.body.notes
            })
            return result.save()
        }

    }).then(result => {
        res.status(200).json({ message: result })

    }).catch(err => {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err)
    });
}
exports.userHis = (req, res, next) => {
    
}