import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsMap extends StatefulWidget {
  const DetailsMap({Key? key}) : super(key: key);

  @override
  _DetailsMapState createState() => _DetailsMapState();
}

class _DetailsMapState extends State<DetailsMap> {
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: showLocation,
        zoom: 10.0,
      ),
      markers: this.getmarkers(),
      mapType: MapType.normal,
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
    );
  }

  Set<Marker> getmarkers() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: showLocation,
        infoWindow: InfoWindow(
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return markers;
  }
}
