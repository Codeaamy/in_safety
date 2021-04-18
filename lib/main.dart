import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insafety/home_screen.dart';
import 'package:insafety/login_Screen.dart';
import 'package:insafety/navbar_screen.dart';
import 'package:insafety/onboarding_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InSafety());
}

class InSafety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser != null ? NavbarScreen() : OnboardingScreen()
    );
  }
}
