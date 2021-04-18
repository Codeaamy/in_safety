import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: kScreensTitleStyle,),
        backgroundColor: darkPurple,
      ),
    );
  }
}
