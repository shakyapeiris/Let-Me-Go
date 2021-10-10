import 'package:flutter/material.dart';
import 'package:mobile/components/user_home/topCard.dart';
import 'package:mobile/components/user_home/map.dart';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import 'dart:async';

// 1. Find users location
// 2. Send it to the backend with a time out
// 3. act according to the response
class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool stopped = true;
  bool isAmbulance = false;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopCard(
            mainTopic: getMainTopic(),
            subTopic: getSubTopic(),
          ),
          DetailsMap(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: stopped ? Colors.red[700] : Colors.green[700],
        child: stopped ? Icon(Icons.play_arrow_rounded) : Icon(Icons.pause),
        onPressed: () {
          setState(() {
            stopped = !stopped;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
