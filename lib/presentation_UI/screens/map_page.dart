import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  LocationData? _currentLocation;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      _currentLocation = _locationData;
    });
  }

  Future<void> _getLocalPharmacies() async {
    if (_currentLocation != null) {
      final apiKey =
          'AIzaSyDyvh4CgV2EPKXl8hJF1deXenn1wAU_2WI'; // Replace with your own API key
      final radius = 20000; // 20km
      final url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentLocation!.latitude},${_currentLocation!.longitude}&radius=$radius&type=pharmacy&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['status'] == 'OK') {
        final results = data['results'];
        setState(() {
          _markers.clear();
          for (var result in results) {
            final name = result['name'];
            final geometry = result['geometry'];
            final location = geometry['location'];
            final latitude = location['lat'];
            final longitude = location['lng'];

            final marker = Marker(
              markerId: MarkerId(name),
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(title: name),
            );

            _markers.add(marker);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'MapPage',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(_currentLocation?.latitude ?? 0,
              _currentLocation?.longitude ?? 0),
          zoom: 14,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },
        myLocationEnabled: true,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_currentLocation != null) {
                _mapController?.animateCamera(CameraUpdate.newLatLng(
                  LatLng(_currentLocation!.latitude!,
                      _currentLocation!.longitude!),
                ));
              }
            },
            child: const Icon(Icons.my_location),
          ),
          FloatingActionButton(
            onPressed: _getLocalPharmacies,
            child: const Icon(Icons.local_pharmacy),
          )
        ],
      ),
    );
  }
}
