const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
const { Server } = require('socket.io');
const dotenv = require('dotenv');

const app = express();

const PORT = process.env.PORT || 8000;

const io = new Server(server);

app.use(bodyParser.json());
app.use(cors());
app.use((req, res, next) => {
  req.io = io;
  next();
});
dotenv.config();

const server = app.listen(PORT, () => {
  console.log(`App started on port ${PORT}`);
});

mongoose
  .connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log('Database connected!');
  })
  .catch(console.log);

const driverRoutes = require('./routes/driver-routes');

app.use('/driver', driverRoutes);

const ambulanceRoutes = require('./routes/ambulance-routes');

app.use('/ambulance', ambulanceRoutes);
