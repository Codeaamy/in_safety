import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/helper_functions.dart';
import 'package:insafety/history_screen.dart';
import 'package:insafety/setting_screen.dart';
import 'package:sim_info/sim_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var simValue = false;
  var phoneRestart = false;
  var theftControll = false;
  var buttonPressedCounter = 0;

  String alternateNumber;

  var userData;
  List history;

  HelperFunctions _helperFunctions = HelperFunctions();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var height = _helperFunctions.getHeight(context);
    var width = _helperFunctions.getWidth(context);
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height / 2,
              color: topColor,
            ),
          ),
          Positioned(
            top: height / 2,
            child: Container(
              width: width,
              height: height / 2,
              color: bottomColour,
            ),
          ),
          Positioned(
            top: (height / 2) - 100,
            left: (width / 2) - 100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 15.0,
                    color: Colors.blueGrey.withOpacity(0.5),
                  ),

                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: (height / 2) - 75,
            left: (width / 2) - 75,
            child: Container(
              height: 150,
              width: 150,
              child: Center(
//              child: Image.asset('images/home_screen_button.png', width:  75, fit: BoxFit.fitWidth,),
              child: Icon(Icons.notifications_none, color: Colors.white, size: 75,),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 15.0,
                    color: Colors.black.withOpacity(0.5),
                  ),

                ],
                shape: BoxShape.circle,
                color: darkPurple,
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            child: Container(
              width: width,
              child: Center(
                child: Text('Press 3 times to tigger SOS Event',textAlign: TextAlign.center  ,style: kScreensTitleStyle.copyWith(
                  fontSize: 20,

                  fontFamily: 'Baloo2',
                  color: Colors.blueGrey,

                  fontWeight: FontWeight.w600,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 3.0,
                      color: Colors.blueGrey.withOpacity(0.5),
                    ),
                  ],
                ),),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Welcome Back,',
                  style: kScreensTitleStyle.copyWith(
                      fontSize: 20, fontFamily: 'Baloo2', color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0, 0),
                        blurRadius: 3.0,
                        color: Colors.blueGrey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
//              SizedBox(height: 10,),

              Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: userData != null
                      ? Text(
                          userData['name'].toString(),
                          style: kScreensTitleStyle.copyWith(
                            fontSize: 35,
                            fontFamily: 'Baloo2',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0, 0),
                                blurRadius: 3.0,
                                color: Colors.blueGrey.withOpacity(0.5),
                              ),
                            ],
                          ),
                        )
                      : Text('User',
                          style: kScreensTitleStyle.copyWith(
                              fontSize: 30, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: 110,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: 100,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Card(
//                  elevation: 10,
//                  borderOnForeground: true,
//                  color: Colors.deepPurpleAccent,
//                  child: MaterialButton(
//                    height: height * 0.3,
//                    minWidth: width,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: [
//                        Center(child: Image.asset('images/home_screen_button.png', width: 100,)),
//                        Padding(
//                          padding: const EdgeInsets.all(20.0),
//                          child: Text('Press in Case of Emergency',
//                          style: kScreensTitleStyle.copyWith(
//                              color: Colors.white),),
//                        ),
//                    ],
//                    ),
//                    onPressed: () {
////                      sendNotification();
////                    print('h');
//                    getSimInfo();
//                    },
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Card(
//                  elevation: 5,
//                  child: Padding(
//                    padding: const EdgeInsets.all(15.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text('Sim Notification', style: kScreensDescStyle,),
//                        FlutterSwitch(
//                          height: 20,
//                          width: 40,
////                          showOnOff: true,
//                          activeColor: darkPurple,
//                          value: simValue,
//                          onToggle: (val) {
//                            setState(() {
//                              simValue = val;
//                              print(val);
//                            });
//                          },
//                        ),
//
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Card(
//                  elevation: 5,
//                  child: Padding(
//                    padding: const EdgeInsets.all(15.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text('Phone Restart', style: kScreensDescStyle,),
//                        FlutterSwitch(
//                          height: 20,
//                          width: 40,
////                          showOnOff: true,
//                          activeColor: darkPurple,
//                          value: phoneRestart,
//                          onToggle: (val) {
//                            setState(() {
//                              phoneRestart = val;
//                              print(val);
//                            });
//                          },
//                        ),
//
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Card(
//                  elevation: 5,
//                  child: Padding(
//                    padding: const EdgeInsets.all(15.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text('Theft Control', style: kScreensDescStyle,),
//                        FlutterSwitch(
//                          height: 20,
//                          width: 40,
////                          showOnOff: true,
//                          activeColor: darkPurple,
//                          value: theftControll,
//                          onToggle: (val) {
//                            setState(() {
//                              theftControll = val;
//                              print(val);
//                            });
//                          },
//                        ),
//
//                      ],
//                    ),
//                  ),
//                ),
//              ),
            ],
          ),
        ]),
      ),
      onTap: (){
        sendNotification();
      },
    );
  }

  void getAlternatePhoneNumber() async {
    var uid = await FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .snapshots()
        .listen((dataSnapshot) {
      if (dataSnapshot != null) {
        setState(() {
          userData = dataSnapshot.data();
          alternateNumber = userData['alternateNumber'];
          history = userData['history'];
        });
      }
    });
  }
  void smallHepticFeedBack(){

  }

  void sendNotification() {
    if (buttonPressedCounter < 3) {
      HapticFeedback.lightImpact();

      _helperFunctions.showToast(
          context: context, color: Colors.black45, title: 'Press button Again');

      buttonPressedCounter++;

      resetCounterAfterDelay();
    } else {
      print("Counter $buttonPressedCounter");
      _helperFunctions.showToast(
          context: context, color: Colors.green, title: 'Notification Sent');

      print('Notification Sent');

      buttonPressedCounter = 0;
    }
  }

  void getSimInfo() async {
    String allowsVOIP = await SimInfo.getAllowsVOIP;
    String carrierName = await SimInfo.getCarrierName;
    String isoCountryCode = await SimInfo.getIsoCountryCode;
    String mobileCountryCode = await SimInfo.getMobileCountryCode;
    String mobileNetworkCode = await SimInfo.getMobileNetworkCode;

    print('''
        allows VOIP ${allowsVOIP} 
        carrier name ${carrierName}
        mobileNetworkCode ${mobileNetworkCode}
        ${isoCountryCode}
        ${mobileCountryCode}
      ''');
  }

  void resetCounterAfterDelay() async {
    Future.delayed(Duration(seconds: 5), () {
      buttonPressedCounter = 0;
    });
  }

  void getUserData() async {
    var uid = await FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .snapshots()
        .listen((dataSnapshot) {
      if (dataSnapshot != null) {
        setState(() {
          userData = dataSnapshot.data();
          alternateNumber = userData['alternateNumber'];
          history = userData['history'];
          print(alternateNumber);
          print(userData['name']);
        });
      }
    });
  }
}
