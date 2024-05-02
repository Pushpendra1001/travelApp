import 'package:flutter/material.dart';
import 'package:travelling_app/Common/bottomBar.dart';

class PaymentPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedHotels;
  final List<Map<String, dynamic>> selectedGuides;
  final List<Map<String, dynamic>> selectedVehicles;

  PaymentPage({
    Key? key,
    required this.selectedHotels,
    required this.selectedGuides,
    required this.selectedVehicles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalAmount = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Hotel 1"),
            trailing: Text(
              "\$" + "100",
            ),
          ),
          ListTile(
            title: Text("Vehicle 1"),
            trailing: Text(
              "\$" + "100",
            ),
          ),
          ListTile(
            title: Text("Guide 1"),
            trailing: Text(
              "\$" + "100",
            ),
          ),
          ListTile(
            title: Text("Total Amount"),
            trailing: Text(
              "\$" + "300",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
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
                    'Pay Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
