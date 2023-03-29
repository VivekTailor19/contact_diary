import 'package:contact_diary/Splash_Screen/splash.dart';
import 'package:contact_diary/contact/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'contact/contact_diary.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Splash_Screen(),
        "contact" : (context) => Prac_Contact_Display(),
        "addcontact": (context) => Add_Contact(),
      },
    ),
  );
}
