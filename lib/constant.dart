
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const darkPurple = Color(0xff118ab2);

const lightPurple = Color(0xff723BAA);


const  bottomColour = Color(0xffD5E4F4);
const  topColor = Color(0xff9DB5D3);
const textFieldShadowColorUp = Color(0xfff6f6f4);

const textFieldShadowColorDown = Color(0xfffafafc);
const kButtonColor = Color(0xFF4ECD55);
const kErrorColor = Color(0xFFC63100);
const blueColor = Color(0xffF0F2F7);


const kScreensTitleStyle = TextStyle( fontSize: 16  , fontWeight: FontWeight.w500);

const kScreensDescStyle = TextStyle( fontSize: 14  ,fontWeight: FontWeight.w400);


const decorationTextField= InputDecoration(
  fillColor: textFieldShadowColorDown,
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  hintText: 'Enter a value',
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
);

