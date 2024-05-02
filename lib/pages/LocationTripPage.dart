import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelling_app/pages/CreateTripPage.dart';
import 'package:travelling_app/pages/PaymentPage.dart';

class LocationTripPage extends StatefulWidget {
  LocationTripPage({super.key, required this.data});

  final Map<String, dynamic> data; // specify the type of data

  @override
  State<LocationTripPage> createState() => _LocationTripPageState();
}

class _LocationTripPageState extends State<LocationTripPage> {
  late List<bool> _addedVehicles;
  late List<bool> _addedGuides;
  late List<bool> _addedHotels;

  @override
  void initState() {
    super.initState();
    _addedHotels = List<bool>.filled(widget.data["hotels"].length, false);
    _addedGuides = List<bool>.filled(widget.data["guides"].length, false);
    _addedVehicles = List<bool>.filled(widget.data["vehicles"].length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(widget.data["image"]),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.data["title"],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.data["place"],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.data["desc"],
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Hotels section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hotels near this place',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.data["hotels"].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://www.gqmiddleeast.com/2021/06/2.-Habtoor-Palace---Exterior.jpg'),
                      title: Text('Hotel ${index + 1}'),
                      subtitle: Text(
                          'Price: ${widget.data["hotels"][index]["price"]}\$\ per night'),
                      trailing: IconButton(
                        icon: Icon(
                            _addedHotels[index] ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            _addedHotels[index] = !_addedHotels[index];
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

            // Hire Guide section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hire a guide for this trip',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.data["guides"].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          'https://www.gqmiddleeast.com/2021/06/2.-Habtoor-Palace---Exterior.jpg'),
                      title: Text('Guide ${index + 1}'),
                      subtitle: Text(
                          'Price: ${widget.data["guides"][index]["price"]}\$\ per day'),
                      trailing: IconButton(
                        icon: Icon(
                            _addedGuides[index] ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            _addedGuides[index] = !_addedGuides[index];
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

            // Vehicles section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Vehicles required for this trip',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.data["vehicles"].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.network(
                          widget.data["vehicles"][index]["image"],
                          width: 50),
                      title: Text('Vehicle ${index + 1}'),
                      subtitle: Text(
                          'Price: ${widget.data["vehicles"][index]["price"]}\$\ per day'),
                      trailing: IconButton(
                        icon: Icon(
                            _addedVehicles[index] ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            _addedVehicles[index] = !_addedVehicles[index];
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

// start
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          selectedGuides: [],
                          selectedHotels: [],
                          selectedVehicles: [],
                        ),
                      ));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

// end
          ]),

          // Book trip button
        ),
      ),
    );
  }
}
