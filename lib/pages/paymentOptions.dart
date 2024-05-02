import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectUpiOption extends StatefulWidget {
  const SelectUpiOption({super.key});

  @override
  State<SelectUpiOption> createState() => _SelectUpiOptionState();
}

class _SelectUpiOptionState extends State<SelectUpiOption> {
  List selection = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Pay with UPI",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
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
                          leading: Image.asset("assets/images/GooglePay.png"),
                          title: const Text(
                            "Google Pay",
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
                        leading: Image.asset("assets/images/PaytmPay.png"),
                        title: const Text(
                          "Paytm",
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
            ],
          ),
          const Spacer(),
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
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Add New UPI ID",
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
    );
  }
}
