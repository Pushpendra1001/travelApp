// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:travelling_app/pages/BookingPage.dart';
import 'package:travelling_app/pages/ExplorePage.dart';
import 'package:travelling_app/pages/HomePage.dart';
import 'package:travelling_app/pages/ProfilePage.dart';
import 'package:travelling_app/pages/historybooking.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [HomePage(), ExplorePage(), BookingPage(), ProfileScreen()],
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 60,
        backgroundColor: Colors.white10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: (_page == 0) ? Colors.black : Colors.grey,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.airplane,
                color: (_page == 1) ? Colors.black : Colors.grey,
              ),
              label: 'Explore',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.money_dollar,
                color: (_page == 2) ? Colors.black : Colors.grey,
              ),
              label: 'Booking',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: (_page == 3) ? Colors.black : Colors.grey,
            ),
            label: 'My Account',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
