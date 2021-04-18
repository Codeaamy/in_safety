import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/home_screen.dart';
import 'package:insafety/navbar_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'helper_functions.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController alternatePhoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  HelperFunctions _helperFunctions = HelperFunctions();

  bool showLoader = false;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace , size: 30 , color: darkPurple),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: showLoader,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),

                  Center(child: Text("Register" , style: TextStyle(fontWeight: FontWeight.w900 ,fontSize: 20 ,color: Colors.black),)),
                  Container(
                    height: 1,
                    width: width * 0.2,
                    color: Colors.black,
                  ),

                  SizedBox(height: 20,),

                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.1,
                          width: width * 0.85,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              //  fillColor: textFieldShadowColorDown,
                              // filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Icon(Icons.person , size: 30 ,color: Colors.grey.shade400,),
                              ),
                              prefixText: "|  ",
                              prefixStyle: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w800 ,color: Colors.grey.shade400),

                              hintStyle: TextStyle(color: Colors.grey.shade400 , fontWeight: FontWeight.w600 , fontSize: 15),
                              hintText: 'Input your name',
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

                              hintStyle: TextStyle(color: Colors.grey.shade400 , fontWeight: FontWeight.w600 ,fontSize: 15),
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

                  SizedBox(height: 20,),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.1,
                          width: width * 0.85,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              //  fillColor: textFieldShadowColorDown,
                              // filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Icon(Icons.phone , size: 30 ,color: Colors.grey.shade400,),
                              ),
                              prefixText: "|  ",
                              prefixStyle: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w800 ,color: Colors.grey.shade400),

                              hintStyle: TextStyle(color: Colors.grey.shade400 , fontWeight: FontWeight.w600 , fontSize: 15),
                              hintText: 'Enter Phone Number',
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
                            keyboardType: TextInputType.number,
                            controller: alternatePhoneNumberController,
                            decoration: InputDecoration(
                              //  fillColor: textFieldShadowColorDown,
                              // filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Icon(Icons.phone , size: 30 ,color: Colors.grey.shade400,),
                              ),
                              prefixText: "|  ",
                              prefixStyle: TextStyle( fontSize: 20 ,fontWeight: FontWeight.w800 ,color: Colors.grey.shade400),

                              hintStyle: TextStyle(color: Colors.grey.shade400 , fontWeight: FontWeight.w600 , fontSize: 15),
                              hintText: 'Enter Alternate Number',
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
                  SizedBox(height: 40,),

                  GestureDetector(
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.35,
                      child: Center(
                        child: Text("Register" ,style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.w400 ,color: Colors.white),),
                      ),
                      decoration: BoxDecoration(
                        color: darkPurple,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    onTap: (){
                      createUser();
                    },
                  ),
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

  void createUser(){
    String name = nameController.text;
    String email= emailController.text;
    String password= passwordController.text;
    String phoneNumber = phoneNumberController.text;
    String alternatePhoneNumber = alternatePhoneNumberController.text;

    if(name != "" && email != "" && password != "" && phoneNumber != "" && alternatePhoneNumber != ""){
      if(phoneNumber == alternatePhoneNumber){
        _helperFunctions.showToast(color: Colors.red, context: context, title: "Phone Number and Alternate phone number cannot be same");

      }else{
        setState(() {
          showLoader = true;
        });

        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password).then((value) {
          var user = value.user;
          var uid = user.uid;

          addDataToFirebase(uid);
        }).catchError((e){
          _helperFunctions.showToast(color: Colors.red, context: context, title: "Could not register user, Try again later");

        });
      }


    }else{
      _helperFunctions.showToast(color: Colors.red, context: context, title: "All fields are compulsary");
    }

  }


  void addDataToFirebase(String uid){
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var data = {
      'uid': uid,
      'name': nameController.text.trim(),
      'email' : emailController.text.trim().toLowerCase(),
      'pushId': '',
      'history': [],
      'alternateNumber' : alternatePhoneNumberController.text.trim(),
      'phoneNumber' : phoneNumberController.text.trim(),
      'timestamp' : timestamp,
    };
    FirebaseFirestore.instance.collection('user').doc(uid).set(data).then((value){
      setState(() {
          showLoader = false;
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NavbarScreen()));
    }).catchError((e){
      setState(() {
        showLoader = false;
      });
      _helperFunctions.showToast(context: context, color: Colors.red, title: 'Failed to save data into database');
    });
  }
}
