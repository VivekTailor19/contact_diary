import 'dart:async';

import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {

    // Future.delayed(Duration(seconds: 2),() {
    //   Navigator.pushReplacementNamed(context, "progress");
    // },);

    //    OR    Use this one//

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, "contact");
    },);




    //   Timer.periodic ===>>  at every sometime get some collect data or information or perform task

    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   print("hello world");
    // });
    // //Here show in Run Bar







    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FlutterLogo(
          size: 250,

          //style: FlutterLogoStyle.stacked,
         // textColor: Colors.red,


      ),),
    );
  }
}
