

import 'package:flutter/material.dart';

import 'constant.dart';


class SettingsRow extends StatelessWidget {
  final Icon icon;
  final String title;
  final String data;
  final Function onPressed;

  const SettingsRow({Key key, this.icon, this.title,this.data , this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 50,),
                  Container(
                    height: 50,
                    child: icon,
                  ),
                  SizedBox(width: 20,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          title, style: kScreensTitleStyle,
                        ),

                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Text(
                            data, style: kScreensDescStyle.copyWith(fontSize: 12, color: Colors.grey)
                        ),

                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              width: 300,
              color: darkPurple,
            )
          ],
        )
      ),
      onTap: onPressed,
    );
  }
}
