import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrh_project/Pagees/ADDarticle.dart';
import 'package:nrh_project/Pagees/calendrier.dart';
import 'package:nrh_project/pagees/empprofile.dart';
import 'package:nrh_project/Pagees/OTP.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:nrh_project/Pagees/Splash_Screen.dart';
import 'pagees/Social.dart';

import 'Pagees/Personnes_page.dart';
import 'Pagees/Reset_pswrd.dart';
import 'Pagees/welcome_page.dart';
import 'Pagees/Login_page.dart';
import 'Pagees/Profile.dart';
import 'pagees/ModifyPswrd.dart';
import 'package:nrh_project/Pagees/Absences_1.dart';
import 'package:nrh_project/Pagees/RequestAbsence.dart';
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NRH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Sign_up_1(),
      //initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        Login.screenRoute: (context) => Login(),
        ResetPswrd.screenRoute: (context) => ResetPswrd(),
        SplashScreen.screenRoute: (context) => SplashScreen(),
        Profile.screenRoute: (context) => Profile(),
        Personnes.screenRoute: (context) => Personnes(),
        Social.screenRoute: (context) => Social(),
        AddArticle.screenRoute: (context) => AddArticle(),
        calendrier.screenRoute: (context) => calendrier(),
        OTPpage.screenRoute: (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final String email = args['email'];

          return OTPpage(email: email);
        },
        Modify.screenRoute: (context) => Modify(),
        empage.screenRoute: (context) => empage(employeeData: {})
      },
    );
  }
}
