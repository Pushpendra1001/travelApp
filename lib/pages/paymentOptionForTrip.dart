import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelling_app/pages/PaymentPage.dart';

class PaymentOptionForTrip extends StatefulWidget {
  const PaymentOptionForTrip({super.key});

  @override
  State<PaymentOptionForTrip> createState() => _PaymentOptionForTripState();
}

class _PaymentOptionForTripState extends State<PaymentOptionForTrip> {
  List selection = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Choose Option",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selection[0] = true;
                        selection[1] = false;
                        selection[2] = false;
                      });
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: ListTile(
                            leading: Image.asset("assets/images/Card.png"),
                            title: const Text(
                              "Debit Card",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: selection[0] == true
                                ? const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      (Icons.done),
                                      color: Colors.white,
                                    ),
                                  )
                                : null),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      selection[0] = false;
                      selection[1] = true;

                      selection[2] = false;
                      setState(() {});
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset("assets/images/PayPal.png"),
                          title: const Text(
                            "PayPal",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: selection[1] == true
                              ? const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    (Icons.done),
                                    color: Colors.white,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      selection[0] = false;
                      selection[1] = false;

                      selection[2] = true;
                      setState(() {});
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: ListTile(
                            leading: Image.asset("assets/images/AmazonPay.png"),
                            title: const Text(
                              "Amazon Pay",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: selection[2] == true
                                ? const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      (Icons.done),
                                      color: Colors.white,
                                    ),
                                  )
                                : null),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: ClipRRect(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: const Size(200, 50),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                      selectedHotels: [],
                                      selectedGuides: [],
                                      selectedVehicles: []),
                                ));
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
