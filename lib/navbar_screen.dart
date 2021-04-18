import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insafety/history_screen.dart';
import 'package:insafety/home_screen.dart';
import 'package:insafety/setting_screen.dart';

import 'constant.dart';

class NavbarScreen extends StatefulWidget {
  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  String alternateNumber;

  var userData;
  List history;

  Widget _showPage = HomeScreen();
  int _page = 0;

  Widget pageChooser(int page){
    switch (page){
      case 0:
        return HistoryScreen(historyList: [1,1]);
        break;
      case 1:
        return HomeScreen();
        break;
      default:
        return SettingScreen();
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 70.0,
        items: [
          Icon(Icons.history , size: 20 , color: Colors.white, ),
          Icon(Icons.dashboard , size: 20 , color: Colors.white, ),
          Icon(Icons.settings , size: 20 , color: Colors.white, ),
        ],
        color: darkPurple,
        buttonBackgroundColor: darkPurple,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),

        onTap: (index) {
          setState(() {
            _showPage = pageChooser( index );
          });
        },
        letIndexChange: (index) => true,
      ) ,

      body: Container(
        child: _showPage,
      ),

    );
  }

  void getUserData() async {
    var uid = await FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('user').doc(uid).snapshots().listen((
        dataSnapshot) {
      if (dataSnapshot != null) {
        setState(() {
          userData = dataSnapshot.data();
          alternateNumber = userData['alternateNumber'];
          history = userData['history'];
        });
      }


    });
  }
}
