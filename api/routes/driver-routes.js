const { checkForAmbulance } = require('../controllers/driver-controller');

const express = require('express');

const router = express.Router();

router.post('/check', checkForAmbulance);

module.exports = router;
