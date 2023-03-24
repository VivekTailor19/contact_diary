import 'package:flutter/material.dart';

import 'practice/prac_contact.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Prac_Contact_Display(),
      },
    ),
  );
}
