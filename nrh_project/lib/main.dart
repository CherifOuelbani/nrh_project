import 'package:flutter/material.dart';

import 'package:nrh_project/Pagees/OTP.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:nrh_project/Pagees/Splash_Screen.dart';
import 'Pagees/Personnes_page.dart';
import 'Pagees/Reset_pswrd.dart';
import 'Pagees/welcome_page.dart';
import 'Pagees/Login_page.dart';
import 'Pagees/Profile.dart';
import 'pagees/ModifyPswrd.dart';

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
      home: Login(),
      //initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        Login.screenRoute: (context) => Login(),
        ResetPswrd.screenRoute: (context) => ResetPswrd(),
        SplashScreen.screenRoute: (context) => SplashScreen(),
        Profile.screenRoute: (context) => Profile(),
        Personnes.screenRoute: (context) => Personnes(),
        OTPpage.screenRoute: (context) {
          // Extract the email from the navigation arguments
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final String email = args['email'];
          // Pass the email to the OTPpage constructor
          return OTPpage(email: email);
        },
        Modify.screenRoute: (context) => Modify(),
      },
    );
  }
}
