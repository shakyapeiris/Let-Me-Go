const Ambulance = require('../models/Ambulance');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

/*
driverName
contactNo
vehicleType
vehicleNo
hospital
password
*/

exports.postRegister = (req, res, next) => {
  const { driverName, contactNo, vehicleType, vehicleNo, hospital, password } =
    req.body;

  Ambulance.findOne({ vehicleNo }).then((filterdAmbulance) => {
    if (filterdAmbulance) {
      return res.status(400).send({
        success: false,
        message: 'Sorry, another account with same vehicle exists',
      });
    }

    const encryptedPassword = bcrypt.hash(password, 10);

    const token = jwt.sign({ email }, process.env.TOKEN_KEY, {
      expiresIn: '24h',
    });

    const newAmbulance = new Ambulance({
      driverName,
      contactNo,
      vehicleNo,
      vehicleType,
      hospital,
      password: encryptedPassword,
    });

    newAmbulance.save.then(({ _id }) => {
      return res.status(200).send({
        success: true,
        message: 'Account created successfully!',
        token,
        id: _id,
      });
    });
  });
};

exports.postLogin = async (req, res, next) => {
  const { vehicleNo, password } = req.body;

  Ambulance.findOne({ vehicleNo })
    .then((result) => {
      if (!result) {
        return res
          .status(400)
          .send({ success: false, message: "Sorry can't find such a user!" });
      }
      if (await bcrypt.compare(password, result.password)) {
        const token = jwt.sign({ vehicleNo }, process.env.TOKEN_KEY, {
          expiresIn: '24h',
        });

        result.token = token;

        result.save();

        // result
        if (result.verified) {
          return res
            .status(200)
            .send({ id: result._id, token, message: 'Done', success: true });
        }
        return res.status(400).send({
          message: 'You must have a verified account to continue',
          success: false,
        });
      }
      return res
        .status(400)
        .send({ message: 'Invalid Credentials', success: false });
    })
    .catch(console.log);
};

exports.startMission = (req, res, next) => {
  const { currLocation, endAddress, token } = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, decoded) => {
    const vehicleNo = decoded.vehicleNo;

    Ambulance.findOne({ vehicleNo })
      .then((result) => {
        if (result.currMission) {
          return res
            .status(400)
            .send({ success: false, message: 'You are already in a mission!' });
        }
        const newMission = {
          startingPoint: currLocation,
          endPoint: endAddress,
          startedOn: new Date().getTime(),
        };
        result.currMission = newMission;

        result
          .save()
          .then(() =>
            res
              .status(200)
              .send({ success: true, message: 'Mission started successfully' })
          );
      })
      .catch(console.log);
  });
};

exports.endMission = (req, res, next) => {
  jwt.verify(token, process.env.TOKEN_KEY, (err, decoded) => {
    const vehicleNo = decoded.vehicleNo;

    Ambulance.findOne({ vehicleNo })
      .then((result) => {
        result.missions.push({
          ...result.currMission,
          totalTime: (
            new Date().getTime() - parseInt(result.currMission.startedOn)
          ).toString(),
        });

        result.currMission = null;

        result
          .save()
          .then(() =>
            res
              .status(200)
              .send({ success: true, message: 'Mission stopped successfully' })
          );
      })
      .catch(console.log);
  });
};

exports.postLocation = (req, res, next) => {
  const ambulanceId = req.body.id;
  const currLocation = req.body.currLocation;
  Ambulance.findById(ambulanceId)
    .then((result) => {
      result.currLocation = currLocation;

      result.save().then(() => {
        res.send({ success: true, message: 'Location updated successfully' });
      });
    })
    .catch((err) => {
      console.log(err);
    });
};
