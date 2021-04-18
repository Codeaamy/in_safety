
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/login_Screen.dart';
import 'package:insafety/onboarding_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions{

  String getDate(){
    var date= DateTime.now().toString();
    var dateParse= DateTime.parse(date);
    var formattedDate =  "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }


  void signOut(BuildContext context)async{
    var fuser = await FirebaseAuth.instance.currentUser;
    if(fuser != null){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));

    }
  }

  double getWidth(BuildContext context){
    var widht = MediaQuery.of(context).size.width;
    return widht;
  }

  double getHeight(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return height;
  }

  showAlert(BuildContext context, AlertType alertType,  String title, String desc, String btnText, Function onpressed){
    Alert(
      context: context,
      type: alertType,
      title: title,
      desc: desc,
      style: AlertStyle(
          isCloseButton: false,
          animationType: AnimationType.grow,
          animationDuration: Duration(milliseconds: 400),

      ),
      buttons: [
        DialogButton(
          child: Text(
            btnText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: onpressed,
          width: 120,
        )
      ],
    ).show();
  }

  showAlertWith2Buttons(BuildContext context, AlertType alertType,  String title, String desc, String buttonText1, Color buttonColorText1, Color buttonColor1, Function onPressed1,
      String buttonText2, Color buttonTextColor2, Color buttonColor2, Function onPressed2
      ){
    Alert(
      context: context,
      type: alertType,
      title: title,
      desc: desc,
      style: AlertStyle(
        isCloseButton: false,
        animationType: AnimationType.grow,
        animationDuration: Duration(milliseconds: 400),

      ),
      buttons: [
        DialogButton(
            child: Text(
              buttonText1,
              style: TextStyle(color: buttonColorText1, fontSize: 20),
            ),
            onPressed: onPressed1,
            color: buttonColor1
        ),
        DialogButton(
          child: Text(
            buttonText2,
            style: TextStyle(color: buttonTextColor2, fontSize: 20),
          ),
          onPressed: onPressed2,
          color: buttonColor2,

        )
      ],
    ).show();
  }





  void showToast({BuildContext context, Color color, String title}) {
    Toast.show(title, context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
        backgroundColor: color);
  }


  Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }



}