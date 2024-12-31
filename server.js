const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const authenticateJWT = require('./middleware/authMiddleware');
const errorMiddleware = require('./middleware/errorMiddleware');
const userRouter = require('./route/userRoute'); 
const categoryRouter = require('./route/categoryRoute');
const productRoute = require('./route/productRoute');
const transactionRoute = require('./route/transactionRoute');
const expensesRoute = require('./route/expensesRoute');

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

app.use('/api', userRouter);
app.use('/api', categoryRouter);
app.use('/api', productRoute);
app.use('/api', transactionRoute);
app.use('/api', expensesRoute);
app.use(errorMiddleware);

app.listen(process.env.PORT, () => {
  console.log(`Server is running on port ${process.env.PORT}`);
});
