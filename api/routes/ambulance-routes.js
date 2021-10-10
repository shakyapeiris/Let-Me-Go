const {
  postLogin,
  postRegister,
  postLocation,
  startMission,
  endMission,
} = require('../controllers/ambulance-controller');

const express = require('express');

const router = express.Router();

router.post('/login', postLogin);

router.post('/register', postRegister);

router.post('/updateLocation', postLocation);

router.post('/start', startMission);

router.post('/end', endMission);

module.exports = router;
