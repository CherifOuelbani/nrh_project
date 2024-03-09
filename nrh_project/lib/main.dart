import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrh_project/Pagees/Settings.dart';
import 'package:nrh_project/Pagees/Sign_up_Step3.dart';
import 'package:nrh_project/Pagees/Sign_up_Step5.dart';
import 'package:nrh_project/components/Dropdown.dart';

import 'Pagees/Sign_up_Step2.dart';
import 'components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/textfield.dart';
import 'components/pack.dart';
import 'Pagees/Sign_Up_Step1.dart';
import 'package:http/http.dart' as http;
import 'package:mongo_dart/mongo_dart.dart';
void main()  {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
  textTheme: GoogleFonts.lexendTextTheme(),
),
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      home: Sign_up_1(),
  
     );
    
  }
}
