import 'package:flutter/material.dart';

class Trip {
  String startDate;
  String endDate;
  String priceRange;
  String location;
  String destination;
  bool needHotel;
  bool needVehicle;
  bool needGuide;

  Trip({
    required this.startDate,
    required this.endDate,
    required this.priceRange,
    required this.location,
    required this.destination,
    required this.needHotel,
    required this.needVehicle,
    required this.needGuide,
  });
}

class TripModel extends ChangeNotifier {
  List<Trip> trips = [];

  void addTrip(Trip trip) {
    trips.add(trip);
    notifyListeners();
  }
}
