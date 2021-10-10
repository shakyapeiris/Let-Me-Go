const Ambulance = require('../models/Ambulance');
const { Server } = require('socket.io');

exports.checkForAmbulance = (req, res, next) => {
  req.io.on('connection', (socket) => {
    socket.on('join_room', (deviceId) => {
      socket.join(deviceId);
    });

    socket.on('position', ({ currLocation, deviceId }) => {
      Ambulance.find({ currMission: {} })
        .then((activeAmbulances) => {
          activeAmbulances.every((ambulance) => {
            const url = `https://maps.googleapis.com/maps/api/distancematrix/json?
            key=${process.env.MAPS_API_KEY}&
            destination=${currLocation.lon}|${currLocation.lat}&
            origins=${ambulance.currLocation.lon}|${ambulance.currLocation.lat}&
            traffic_model=best_guess`;
            fetch(url)
              .then((response) => response.json())
              .then((data) => {
                console.log(data);
                // if (distance < 500) {
                //   socket.to(deviceId).emit({
                //     haveToStop: true,
                //     ambulanceData: {
                //       vehicleNo: ambulance.vehicleNo,
                //       vehicleType: ambulance.vehicleType,
                //       mission: ambulance.currMission,
                //       vehicleLocation: ambulance.currLocation,
                //     },
                //   });
                // }
                return;
              });
          });
        })
        .catch(console.log);
    });
  });
};
