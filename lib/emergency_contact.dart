import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';

class EmergencyContact extends StatefulWidget {
  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact', style: kScreensTitleStyle,),
        backgroundColor: darkPurple,
      ),
      body: Column(
        
      ),
    );
  }
}
