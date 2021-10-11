import 'package:flutter/material.dart';
import 'package:mobile/components/user_home/topCard.dart';
import 'package:mobile/components/user_home/map.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import '../utils/userHomeUtils.dart';
// import 'package:geolocator/geolocator.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool stopped = true;
  bool isAmbulance = false;
  late Object? ambulanceData;
  Io.Socket socket = Io.io(URL);

  late HomeUtils homeUtils;

  @override
  void initState() {
    super.initState();
    homeUtils = new HomeUtils(
        stopped: stopped,
        isAmbulance: isAmbulance,
        ambulanceData: ambulanceData,
        socket: socket,
        setState: setState);
    homeUtils.setSocket();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopCard(
            mainTopic: homeUtils.getMainTopic(),
            subTopic: homeUtils.getSubTopic(),
          ),
          DetailsMap(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: homeUtils.getBackGroundColor(),
        child: homeUtils.getIcon(),
        onPressed: homeUtils.toggleStatus(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
