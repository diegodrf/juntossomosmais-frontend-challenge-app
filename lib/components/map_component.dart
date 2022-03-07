import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double zoom;

  late LatLng _location = LatLng(latitude, longitude);
  late GoogleMapController _controller;
  late CameraPosition _initialCameraPosition;
  late Marker _marker;

  MapComponent({
    Key? key,
    required this.latitude,
    required this.longitude,
    this.zoom = 12.0,
  }) : super(key: key) {
    _location = LatLng(latitude, longitude);
    _initialCameraPosition = CameraPosition(target: _location, zoom: zoom);
    _marker = Marker(
      markerId: const MarkerId('randomMarker'),
      position: _location,
      infoWindow: InfoWindow(
        title: 'local',
        snippet: '$latitude, $longitude',
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: _initialCameraPosition,
      markers: {_marker},
      mapType: MapType.normal,
    );
  }
}
