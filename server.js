const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const authenticateJWT = require('./middleware/authMiddleware');
const errorMiddleware = require('./middleware/errorMiddleware');
const userRouter = require('./route/userRoute');  

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

app.use('/api', userRouter);
app.use(errorMiddleware);

app.listen(process.env.PORT, () => {
  console.log(`Server is running on port ${process.env.PORT}`);
});
