import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/helper_functions.dart';
import 'package:insafety/home_screen.dart';
import 'package:insafety/navbar_screen.dart';
import 'package:insafety/registration_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  HelperFunctions _helperFunctions = HelperFunctions();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  var uid ;
  bool showLoader = false;
  bool isEnabled = true;




  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: showLoader,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                    ],
                  ),

                  SizedBox(height: 50,),
                  Center(child: Text("Login" , style: TextStyle(fontWeight: FontWeight.w900 ,fontSize: 20 ,color: Colors.black),)),
                  Container(
                    height: 1,
                    width: width * 0.15,
                    color: Colors.black,
                  ),

                  SizedBox(height: 50,),

                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.1,
                          width: width * 0.85,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              //  fillColor: textFieldShadowColorDown,
                              // filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Icon(Icons.mail_outline , size: 30 ,color: Colors.grey.shade400,),
                              ),
                              prefixText: "|  ",
                              prefixStyle: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w800 ,color: Colors.grey.shade400),

                              hintStyle: TextStyle(color: Colors.grey.shade400 , fontWeight: FontWeight.w600 , fontSize: 15),
                              hintText: 'Input your email ID',
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight: Radius.circular(12))
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight: Radius.circular(12))
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight: Radius.circular(12))
                              ),
                            ),
                          ),
//
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 70 ,
                          width : 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12) ,bottomLeft: Radius.circular(12)),
                              color: darkPurple
                          ),
                        ),
                        left: 30,
                        top: 2,
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.1,
                          width: width * 0.85,
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              //  fillColor: textFieldShadowColorDown,
                              // filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                                child: Icon(Icons.vpn_key , size: 25 ,color: Colors.grey.shade400,),
                              ),
                              prefixText: "|  ",
                              prefixStyle: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w800 ,color: Colors.grey.shade400),

                              hintStyle: TextStyle(color: Colors.grey.shade400 , fontWeight: FontWeight.w600, fontSize: 15),
                              hintText: 'Input your password',
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight: Radius.circular(12))
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight: Radius.circular(12))
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12) , topRight: Radius.circular(12))
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 70 ,
                          width : 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12) ,bottomLeft: Radius.circular(12)),
                              color: darkPurple
                          ),
                        ),
                        left: 30,
                        top: 2,
                      ),
                    ],
                  ),


                  SizedBox(height: 40,),
                  GestureDetector(
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.35,
                      child: Center(
                        child: Text("Login" ,style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.w400 ,color: Colors.white),),
                      ),
                      decoration: BoxDecoration(
                        color: darkPurple,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    onTap: (){
                      var email = emailController.text;
                      var password = passwordController.text;
                      if(email == "" || password == ""){
                        _helperFunctions.showToast(context: context, color: Colors.redAccent, title: 'Email Id or Password cannot be blank');
                      }else{
                        loginUser();
                      }
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Text("Register Here" ,style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.w400 ,color: Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Container(
                                height: 1,
                                width: width * 0.35,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 40,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Column(
                          children: [
//                            Padding(
//                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
//                              child: Text("Login With" ,style: TextStyle(fontSize: 12 , fontFamily: 'Orbitron' ,fontWeight: FontWeight.w400 ,color: Colors.black)),
//                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Container(
                                height: 1,
                                width: width * 0.18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                        },
                      ),
                    ),
                  ),



                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        FocusScope.of(context).unfocus();

      },
    );
  }


  void loginUser()async {
    setState(() {
      showLoader = true;
    });

    var email = emailController.text;
    var password = passwordController.text;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      _helperFunctions.showToast(
          context: context,
          title: 'Authentication Success',
          color: kButtonColor);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => NavbarScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          showLoader = false;
        });
        _helperFunctions.showToast(
            context: context,
            title: 'No user found for that email',
            color: kErrorColor);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          showLoader = false;
        });
        _helperFunctions.showToast(
            context: context,
            title: 'Wrong password provided for that user',
            color: kErrorColor);
        print('Wrong password provided for that user.');
      }
    }
  }
}
