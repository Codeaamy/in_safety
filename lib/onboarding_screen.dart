import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/home_screen.dart';
import 'package:insafety/login_Screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatefulWidget {




  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;
  var nextButtonText = "Next";

  String sos_text = 'The SOS key will allow you to send a predefined Notification / Message / Email / Photos including your current location, to up to three predefined contacts through the InSafety Mobile App, installed on the device';
  String gps_tracking = 'The location shared by the app will be established by your mobile device, and sent Notification / Message / Email to the Emergency contact you specified';
  String alert = 'In case of Emergency/ Theft Activity / Sim Change / Phone Restart, InSafety mobile app will allow you to send a predefined Notification by Email / Message which will have photos and alsi your currnet location, to upto three emergency contact and on your alternate number.';

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 260,

            child: Container(
//              height: 400,
              width: 300,
              child: Column(
                children: [
                  SizedBox(height: 200,),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('The SOS key will allow you to send a predefined Notification / Message / Email / Photos including your current location, to up to three predefined contacts through the InSafety Mobile App, installed on the device', style: kScreensDescStyle.copyWith(color: Colors.white),),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0xffDF625F),
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),]

              ),
            ),
          ),
          Positioned(
            top: 70,
            child: Container(
              width: 270,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sos_service.png'),

                ),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white

              ),
            ),
          ),

        ]
      ),
    ),
    Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 260,

              child: Container(
//                height: 400,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(height: 200,),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text('The location shared by the app will be established by your mobile device, and sent Notification / Message / Email to the Emergency contact you specified', style: kScreensDescStyle.copyWith(color: Colors.white),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0xffADA8E8),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),]

                ),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                width: 270,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/gps_alert.png'),

                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white
                ),
              ),
            ),
            Positioned(
                top: 70,
                child: Text('GPS Tracking', style: kScreensTitleStyle.copyWith(color: Color(0xffADA8E8)),))

          ]
      ),
    ),
    Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 260,

              child: Container(
//                height: 400,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(height: 200,),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text('In case of Emergency/ Theft Activity / Sim Change / Phone Restart, InSafety mobile app will allow you to send a predefined Notification by Email / Message which will have photos and alsi your currnet location, to upto three emergency contact and on your alternate number.', style: kScreensDescStyle.copyWith(color: Colors.white),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: darkPurple,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),]

                ),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                width: 270,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/alert.png'),

                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white

                ),
              ),
            ),
            Positioned(
                top: 70,
                child: Text('Alert', style: kScreensTitleStyle.copyWith(color: darkPurple),))

          ]
      ),
    ),

  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      )
    );

    double zoom = 1.0 + (2.0 - 1.0)* selectedness ;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: darkPurple,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              positionSlideIcon: 0.8,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
              enableLoop: false,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    if(liquidController.currentPage > 1){
                      setState(() {
                        nextButtonText = "Go To App";

                      });
                      var user = FirebaseAuth.instance.currentUser;
                      if(user == null){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                      }else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));

                      }

                    }
                    liquidController.jumpToPage(
                        page:
                        liquidController.currentPage + 1 > pages.length - 1
                            ? 0
                            : liquidController.currentPage + 1);
                  },
                  child: Text(nextButtonText),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}

