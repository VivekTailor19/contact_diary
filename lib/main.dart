import 'package:contact_diary/Splash_Screen/splash.dart';
import 'package:flutter/material.dart';

import 'contact/contact_diary.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Splash_Screen(),
        "contact" : (context) => Prac_Contact_Display(),
      },
    ),
  );
}
