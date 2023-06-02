import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  GoogleMapController? _mapController;
  LocationData? _currentLocation;
  Set<Marker> _markers = {};
  List<bool> _isLoadingList = List<bool>.generate(3, (index) => false);
  String? selectedType; // Add this variable
  int _activeButtonIndex = -1; // Track the active button index

  // TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _getLocation();
    // _tabController = TabController(length: 3, vsync: this);
  }

  Polyline? _polyline;
  // List<LatLng> _polylinePoints = [];

  void _onMarkerTapped(MarkerId markerId) async {
    final tappedMarker =
        _markers.firstWhere((marker) => marker.markerId == markerId);
    final destination = tappedMarker.position;

    if (_polyline != null) {
      setState(() {
        _polyline = null;
      });
    }

    final apiKey =
        'AIzaSyDyvh4CgV2EPKXl8hJF1deXenn1wAU_2WI'; // Replace with your own Google Maps API key

    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_currentLocation?.latitude},${_currentLocation?.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (response.statusCode == 200 && data['status'] == 'OK') {
      final routes = data['routes'];
      if (routes.isNotEmpty) {
        final points = routes[0]['overview_polyline']['points'];
        final polylinePoints = decodePolyline(points);

        List<LatLng> polylineCoordinates = [];

        for (var point in polylinePoints) {
          double lat = point.latitude;
          double lng = point.longitude;
          polylineCoordinates.add(LatLng(lat, lng));
        }

        setState(() {
          _polyline = Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            points: polylineCoordinates,
            width: 3,
          );
        });
      }
    }
  }

  List<LatLng> decodePolyline(String polyline) {
    var points = <LatLng>[];
    var index = 0, len = polyline.length;
    var lat = 0, lng = 0;

    while (index < len) {
      var b, shift = 0, result = 0;

      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      var dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      var dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
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

      if (_mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          ),
        );
      }
    });
  }

  Future<void> _getLocalInstitutions(String type, int index) async {
    setState(() {
      _isLoadingList[index] = true;
      _activeButtonIndex = index; // Update the active button index
      _markers.clear(); // Clear existing markers
    });

    if (_currentLocation != null) {
      final apiKey =
          'AIzaSyDyvh4CgV2EPKXl8hJF1deXenn1wAU_2WI'; // Replace with your own API key
      final radius = 20000; // 20km
      final url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentLocation!.latitude},${_currentLocation!.longitude}&radius=$radius&type=$type&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['status'] == 'OK') {
        final results = data['results'];

        for (var result in results) {
          final name = result['name'];
          final geometry = result['geometry'];
          final location = geometry['location'];
          final latitude = location['lat'];
          final longitude = location['lng'];

          final marker = Marker(
            onTap: () {
              _onMarkerTapped(MarkerId(name));
            },
            markerId: MarkerId(name),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: name),
          );

          setState(() {
            _markers.add(marker);
          });
        }
      }
    }

    setState(() {
      _isLoadingList[index] =
          false; // Set loading state to false for the corresponding button
    });
  }

  List<Widget> buildAppBarButtons() {
    return List.generate(institutionTypes.length, (index) {
      final type = institutionTypes[index];
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.white; // Disabled color
              }
              return Colors.black; // Enabled color
            }),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
            // textStyle:
            // MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 16)),
            elevation: MaterialStateProperty.all<double>(4),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          onPressed: _isLoadingList[index]
              ? null
              : () => _getLocalInstitutions(type, index),
          child: _isLoadingList[index]
              ? Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Text(type),
        ),
      );
    });
  }

  List<String> institutionTypes = [
    'Pharmacy',
    'Health',
    'Hospital',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: institutionTypes.asMap().entries.map((entry) {
              final index = entry.key;
              final type = entry.value;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: _isLoadingList[index]
                      ? null
                      : () {
                          _getLocalInstitutions(type, index);
                        },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double?>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _activeButtonIndex == index
                          ? Colors.black // Set active button color to black
                          : Color(0xffF5F5F6),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: !_isLoadingList[index],
                        child: Text(
                          type,
                          style: TextStyle(
                            color: _activeButtonIndex == index
                                ? Colors
                                    .white // Set active button text color to white
                                : Colors.black,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isLoadingList[index],
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        polylines: Set<Polyline>.of(_polyline != null ? [_polyline!] : []),
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
            backgroundColor: Colors.white,
            onPressed: () {
              if (_currentLocation != null) {
                _mapController?.animateCamera(CameraUpdate.newLatLng(
                  LatLng(_currentLocation!.latitude!,
                      _currentLocation!.longitude!),
                ));
              }
            },
            child: SvgPicture.asset(
              'assets/svg/compass.svg',
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
