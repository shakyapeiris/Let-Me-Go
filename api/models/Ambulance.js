const { Schema, model } = require('mongoose');

const AmbulenceSchema = new Schema({
  contactNo: {
    type: String,
    required: true,
  },
  token: String,
  vehicleNo: {
    type: String,
    required: true,
  },
  vehicleType: {
    type: String,
    required: true,
  },
  driverName: {
    type: String,
    require: true,
  },
  hospital: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: false,
  },
  currMission: {
    type:
      {
        startingPoint: {
          lon: String,
          lat: String,
        },
        endPoint: {
          type: String,
          required: true,
        },
        startedOn: {
          type: String,
          default: new Date().getTime(),
        },
      } || null,
    default: null,
  },
  verified: {
    type: Boolean,
    default: false,
  },
  currLocation: {
    lat: {
      type: String,
      required: true,
    },
    lon: {
      type: String,
      require: true,
    },
  },
  missions: [
    {
      startingPoint: {
        type: String,
        required: true,
      },
      endPoint: {
        type: String,
        required: true,
      },
      startedOn: {
        type: String,
        default: new Date().getTime(),
      },
      totalTime: {
        type: String,
        default: 0,
      },
    },
  ],
});

module.exports = new model('Ambulance', AmbulenceSchema);
