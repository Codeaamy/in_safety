import 'package:flutter/material.dart';
import 'package:insafety/constant.dart';
import 'package:insafety/emergency_contact.dart';
import 'package:insafety/helper_functions.dart';
import 'package:insafety/membership_screen.dart';
import 'package:insafety/notification_screens.dart';
import 'package:insafety/profile_screen.dart';
import 'package:insafety/settings_row.dart';

class SettingScreen extends StatelessWidget {

  HelperFunctions _helperFunctions = HelperFunctions();

  @override
  Widget build(BuildContext context) {
    var width = _helperFunctions.getWidth(context);
    var height = _helperFunctions.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: Text('  Settings'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children:[
              Column(
              children: [
                SizedBox(height: 10,),
                GestureDetector(
                  child: Container(
                    width: width - 30,
                    height: height * 0.3,
                    color: Colors.black26,
                  ),
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                  },
                ),
                SizedBox(height: 20,),
//              SettingsRow(icon: Icon(Icons.person, color: Colors.pinkAccent,), title: 'Profile', data: 'Get your profile information',),
                SettingsRow(icon: Icon(Icons.info_outline, color: darkPurple,), title: 'Emergency Contact', data: 'Manage your emergency contacts', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => EmergencyContact()) );

                },),


                SettingsRow(icon: Icon(Icons.notifications, color: Colors.orange,), title: 'Notification Settings', data: 'Manage your Notification Settings', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen()) );
                },),

                SettingsRow(icon: Icon(Icons.wallet_membership_sharp, color: Colors.purpleAccent,), title: 'Membership', data: 'Users Membership status', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MembershipScreen()));

                },),
                SettingsRow(icon: Icon(Icons.money_rounded, color: Colors.brown,), title: 'Referral', data: 'Invite your friends and earn wallet money',),
                SettingsRow(icon: Icon(Icons.money_off, color: Colors.teal,), title: 'Refund Policy', data: 'InSafety Refund Policy',),
                SettingsRow(icon: Icon(Icons.privacy_tip, color: Colors.yellow,), title: 'Privacy Policy', data: 'Application privacy policy',),
                SettingsRow(icon: Icon(Icons.insert_drive_file, color: Colors.greenAccent,), title: 'Terms and Conditions', data: 'Application terms and conditions',),
                SettingsRow(icon: Icon(Icons.logout, color: Colors.red,), title: 'Logout', data: 'Logout user from the app',onPressed: (){
                  _helperFunctions.signOut(context);
                },),


                Text('From'),
                Text('CODEAAMY', style: kScreensTitleStyle.copyWith(color: Colors.red),),
                SizedBox(height: 30,),




              ],
            ),
              Positioned(
                top: height * 0.3 - 10,
                child: Container(width: width * 0.7,height: 40,
                  child: Center(child: Text('Upgrade to Premium', style: kScreensTitleStyle.copyWith(color: Colors.white),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: darkPurple
                  ),

                ),
              )

            ]
          ),
        ),
      ),
    );
  }


}
