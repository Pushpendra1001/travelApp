import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:travelling_app/models/TripModel.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tripModel = Provider.of<TripModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Your Plans", style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: tripModel.trips.length,
                itemBuilder: (context, index) {
                  var trip = tripModel.trips[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Trip : ${index + 1}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Start Date: ${trip.startDate}'),
                            Text('End Date: ${trip.endDate}'),
                            Text('Price Range: ${trip.priceRange}'),
                            Text('Location: ${trip.location}'),
                            Text('Destination: ${trip.destination}'),
                            Text(
                                'Need Hotel: ${trip.needHotel ? 'Yes' : 'No'}'),
                            Text(
                                'Need Vehicle: ${trip.needVehicle ? 'Yes' : 'No'}'),
                            Text(
                                'Need Guide: ${trip.needGuide ? 'Yes' : 'No'}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
