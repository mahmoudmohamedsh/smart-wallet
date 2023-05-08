const express = require('express');
const app = express();
require('dotenv/config');
const userRoutes = require('./routers/userRouter');
const paymentRouter = require('./routers/paymentRouter');
const bodyparser = require('body-parser');
const mongoose = require('mongoose');

app.use(bodyparser.json());//express.json()

app.use('/auth',userRoutes);
app.use('/payment',paymentRouter);


app.use((err,req,res,next)=>{
  const status = err.statusCode || 500;
  const message = err.message;
  const data = err.data;
  res.status(status).json({message:message,data:data});
});

mongoose.connect(process.env.MONGODB_URL)
.then(result => {
    const PORT = process.env.PORT || 8080; 
    app.listen(PORT, () => {
        console.log(`Example app listening on port ${PORT}`)
      })
})
.catch(err => console.log(err))

