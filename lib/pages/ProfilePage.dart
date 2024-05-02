import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/pages/EditProfilePage.dart';
import 'package:travelling_app/pages/ExpenseTracking.dart';
import 'package:travelling_app/pages/ExplorePage.dart';
import 'package:travelling_app/pages/historybooking.dart';
import 'package:travelling_app/pages/login/signIn.dart';
import 'package:travelling_app/pages/paymentOptions.dart';
import 'package:travelling_app/widgets/profileItem.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: CircleAvatar(
                  radius: 64,
                  child: Icon(
                    Icons.person,
                    size: 64,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "User Name",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    profileItem(
                      icon: CupertinoIcons.person,
                      itemName: "Edit Profile",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ));
                      },
                    ),
                    const Divider(),
                    profileItem(
                      icon: CupertinoIcons.viewfinder_circle,
                      itemName: "All Bookings",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HisotryBooking(),
                            ));
                      },
                    ),
                    const Divider(),
                    profileItem(
                      icon: CupertinoIcons.app_badge_fill,
                      itemName: "Payment",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectUpiOption(),
                            ));
                      },
                    ),
                    const Divider(),
                    profileItem(
                      icon: CupertinoIcons.money_dollar,
                      itemName: "Expense Tracking",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExpenseTracking(),
                            ));
                      },
                    ),
                    const Divider(),
                    profileItem(
                      icon: Icons.logout,
                      itemName: "Log Out",
                      press: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ));
                      },
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
