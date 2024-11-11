import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WasteManagementScreen extends StatefulWidget {
  WasteManagementScreen({Key? key}) : super(key: key);

  @override
  _WasteManagementScreenState createState() => _WasteManagementScreenState();
}

class _WasteManagementScreenState extends State<WasteManagementScreen> {
  late GoogleMapController mapController;
  final LatLng _center = LatLng(12.9716, 77.5946);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Waste Management')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
    );
  }
}
