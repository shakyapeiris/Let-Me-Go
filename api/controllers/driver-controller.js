const Ambulance = require('../models/Ambulance');

exports.checkForAmbulance = (req, res, next) => {
  const currLocation = req.body.location;

  Ambulance.find({ currMission: {} })
    .then((activeAmbulances) => {
      activeAmbulances.every((ambulance) => {
        const url = `https://maps.googleapis.com/maps/api/distancematrix/json?
          key=${process.env.MAPS_API_KEY}&
          destination=${currLocation.lon}|${currLocation.lat}&
          origins=${ambulance.currLocation.lon}|${ambulance.currLocation.lat}&
          traffic_model=best_guess`;
        fetch(url)
          .then((response) => response.json)
          .then((data) => {
            console.log(data);
            // if (distance < 500) {
            //   return res.status(200).send({
            //     haveToStop: true,
            //     ambulanceData: {
            //       vehicleNo: ambulance.vehicleNo,
            //       vehicleType: ambulance.vehicleType,
            //       mission: ambulance.currMission,
            //       vehicleLocation: ambulance.currLocation,
            //     },
            //   });
            // }
          });
      });
    })
    .catch(console.log);
};
