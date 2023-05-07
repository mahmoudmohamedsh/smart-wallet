const jwt = require('jsonwebtoken');
require('dotenv/config');

module.exports = (req,res,next)=>{
    const authHeader = req.get('Authorization');
    if(!authHeader){
        const error = new Error('not Authenticated');
        error.statusCode = 401;
        throw error;
    }

    const token = authHeader.split(' ')[1];
    let decodedtoken;
    try{
        decodedtoken = jwt.verify(token,process.env.SECRET);
    }catch(err){
        err.statusCode = 500;
        throw err;
    }

    if(!decodedtoken){
        const error = new Error('not authenticated');
        error.statusCode = 401;
        throw error;
    }
    req.userId = decodedtoken.userId;
    next();
}