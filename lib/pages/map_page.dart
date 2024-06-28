import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:ui' as ui; // For image loading

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

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
      UserLocation(latitude: 37.37796133580664, longitude: -122.0987749655962),
    ];

    // Convert user locations to markers
    return activeUsers.map((userLocation) {
      return Marker(
        markerId: MarkerId(userLocation.toString()),
        position: LatLng(userLocation.latitude, userLocation.longitude),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: InfoWindow(title: 'Active User'),
      );
    }).toSet();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 10.0,
                ),
                markers: markers,
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
