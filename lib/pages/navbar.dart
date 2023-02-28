
import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sheet_db/components/event_card.dart';
import 'package:google_sheet_db/pages/clubandchapter.dart';
import 'package:google_sheet_db/pages/events.dart';
import 'package:google_sheet_db/pages/notifications.dart';


class DamnTime extends StatefulWidget {
  @override
  _DamnTimeState createState() => _DamnTimeState();
}

class _DamnTimeState extends State<DamnTime> {
  int _currentIndex = 0;
  PageController _pageController = PageController();


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            if (index == 3) {
            }
            if (index == 1) {

            }
            setState(() => _currentIndex = index);
          },

          children: <Widget>[
            EventCards(),
            ClubChapter(),
            NotificationPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
          child: BottomNavyBar(
            backgroundColor: Colors.black,
            showElevation: false,
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              if (index == 3) {

              }
              if (_currentIndex == 3) {

              }
              if (index == 1) {

              }
              if (_currentIndex == 1) {

              }
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                title: Text('Events',style: TextStyle(fontFamily: 'Cubano',fontWeight: FontWeight.w100),),
                // icon: Icon(Icons.home),
                icon: Icon(
                  Icons.calendar_today_rounded,
                  size: 22,color: Colors.white,
                ),
                textAlign: TextAlign.center,
                activeColor: Colors.white,
                inactiveColor: Colors.white,
              ),
              BottomNavyBarItem(
                title: Text('Clubs',style: TextStyle(fontFamily: 'Cubano',fontWeight: FontWeight.w100),),
                // icon: Icon(Icons.library_books),
                icon: Icon(
                  Icons.list_alt_rounded,
                  size: 22,color: Colors.white,
                ),
                textAlign: TextAlign.center,
                activeColor: Colors.white,
                inactiveColor: Colors.white,
              ),
              BottomNavyBarItem(
                title: Text('Notifications',style: TextStyle(fontFamily: 'Cubano',fontWeight: FontWeight.w100,fontSize: 10),),
                // icon: Icon(Icons.stars),
                icon: Icon(
                  Icons.notifications_active_rounded,
                  size: 22,color: Colors.white,
                ),
                textAlign: TextAlign.center,
                activeColor: Colors.white,
                inactiveColor: Colors.white,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
