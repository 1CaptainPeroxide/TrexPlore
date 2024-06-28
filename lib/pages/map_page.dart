import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:trexplore/components/map_style.dart'; // Import your map styles

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  final MapStyle mapStyle = MapStyle();
  String currentMapStyle = '';

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  Future<void> _loadCustomMarker() async {
    final Uint8List markerIcon = await _getBytesFromAsset('lib/icons/man.png', 80); // Adjust size here
    setState(() {
      markers = _createMarkers(markerIcon);
    });
  }

  Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Set<Marker> _createMarkers(Uint8List markerIcon) {
    // Dummy data for markers (replace with your logic)
    List<UserLocation> activeUsers = [
      UserLocation(latitude: 37.42796133580664, longitude: -122.085749655962),
      UserLocation(latitude: 37.4219999, longitude: -122.0840575),
      UserLocation(latitude: 37.420580, longitude: -122.083885),
      UserLocation(latitude: 37.420510, longitude: -122.081927),
      UserLocation(latitude: 37.423704, longitude: -122.086741),
      UserLocation(latitude: 37.423035, longitude: -122.084245),
      UserLocation(latitude: 37.421743, longitude: -122.083822),
      UserLocation(latitude: 37.421012, longitude: -122.084378),
      UserLocation(latitude: 37.420955, longitude: -122.082932),
      UserLocation(latitude: 37.424802, longitude: -122.083124),
      UserLocation(latitude: 37.425065, longitude: -122.081999),
      UserLocation(latitude: 37.426500, longitude: -122.080327),
      UserLocation(latitude: 37.426782, longitude: -122.081214),
      UserLocation(latitude: 37.425602, longitude: -122.081508),
      UserLocation(latitude: 37.426350, longitude: -122.081989),
    ];

    // Convert user locations to markers
    markers = activeUsers.map((userLocation) {
      return Marker(
        markerId: MarkerId(userLocation.toString()),
        position: LatLng(userLocation.latitude, userLocation.longitude),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: InfoWindow(title: 'Active User'),
      );
    }).toSet();

    return markers;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _applyMapStyle();
  }

  void _applyMapStyle() {
    mapController.setMapStyle(currentMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 255, 0, 85), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(
          'Find Trexplorers',
          style: GoogleFonts.vollkorn(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                switch (value) {
                  case 'Aubergine':
                    currentMapStyle = mapStyle.aubergine;
                    break;
                  case 'Retro':
                    currentMapStyle = mapStyle.retro;
                    break;
                  case 'Dark':
                    currentMapStyle = mapStyle.dark;
                    break;
                  case 'Night':
                    currentMapStyle = mapStyle.night;
                    break;
                }
                _applyMapStyle();
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'Aubergine', child: Text('Aubergine')),
              PopupMenuItem(value: 'Retro', child: Text('Retro')),
              PopupMenuItem(value: 'Dark', child: Text('Dark')),
              PopupMenuItem(value: 'Night', child: Text('Night')),
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'UserLocation{latitude: $latitude, longitude: $longitude}';
  }
}
