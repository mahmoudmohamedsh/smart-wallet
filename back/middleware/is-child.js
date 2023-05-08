const userModel = require('../models/userModel')

exports.isChild = (req,res,next)=>{
    userModel.findById(req.userId).then(user => {
        if(!user){
            const error = new Error('user not found');
            error.statusCode = 404;
            throw error;
        }
        req.isChild = user.isUserChild;
        next()
    }).catch(err=>{
        if(!err.statusCode){
            err.statusCode = 500;
        }
        next(err)
    })
}