import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';

class LocationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Update user's location in Firestore
  Future<void> updateLocation(double latitude, double longitude) async {
    try {
      final String userId = _auth.currentUser!.uid;
      final Timestamp timestamp = Timestamp.now();

      await _firestore.collection('user_locations').doc(userId).set({
        'userId': userId,
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': timestamp,
      });
    } catch (e) {
      print('Error updating location: $e');
    }
  }

  // Stream of nearby active users' locations within 24 hours
  Stream<List<UserLocation>> getActiveUsersLocations() {
    DateTime twentyFourHoursAgo = DateTime.now().subtract(Duration(hours: 24));
    return _firestore.collection('user_locations')
        .where('timestamp', isGreaterThan: twentyFourHoursAgo)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => UserLocation.fromSnapshot(doc)).toList());
  }
}

class UserLocation {
  final String userId;
  final double latitude;
  final double longitude;
  final Timestamp timestamp;

  UserLocation({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  factory UserLocation.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return UserLocation(
      userId: data['userId'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      timestamp: data['timestamp'],
    );
  }
}
