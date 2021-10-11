import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'dart:io';

const URL = "http://localhost:8000/user/check";

class HomeUtils {
  bool stopped;
  bool isAmbulance;
  late Object? ambulanceData;
  late Io.Socket socket = Io.io(URL);
  late void Function(void Function()) setState;

  HomeUtils({
    required this.stopped,
    required this.isAmbulance,
    required this.ambulanceData,
    required this.socket,
    required this.setState,
  });

  Future<String> getDeviceId() async {
    String identifier;

    final DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      identifier = androidDeviceInfo.androidId;
    } else {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      identifier = iosDeviceInfo.identifierForVendor;
    }

    return identifier;
  }

  void setSocket() {
    socket.connect();
    socket.onConnect((_) {
      socket.emit("join_room", getDeviceId());
    });

    socket.on("ambulanceData", (data) {
      if (data != null) {
        setState(() {
          ambulanceData = data;
          isAmbulance = true;
        });
      } else {
        setState(() {
          ambulanceData = data;
          isAmbulance = false;
        });
      }
    });

    while (socket.connected) {
      socket.emit("position", {
        'currLocation': 'this',
        'deviceId': getDeviceId(),
      });
    }
  }

  String getMainTopic() => stopped
      ? "Stopped"
      : isAmbulance
          ? "An ambulance"
          : "Go Forward";

  String getSubTopic() => stopped
      ? "Click on the red button to continue"
      : isAmbulance
          ? "Seems like an ambulance near by you"
          : "No problems continue your journey";

  toggleStatus() {
    setState(() {
      stopped = !stopped;
    });
  }

  Color? getBackGroundColor() => stopped ? Colors.red[700] : Colors.green[700];
  Icon getIcon() =>
      stopped ? Icon(Icons.play_arrow_rounded) : Icon(Icons.pause);
}
