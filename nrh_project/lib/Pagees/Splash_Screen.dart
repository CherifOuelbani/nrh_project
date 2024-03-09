import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrh_project/Pagees/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
  static const String screenRoute = 'Splash_screen';
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () =>
            Navigator.pushReplacementNamed(context, WelcomeScreen.screenRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 159.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/team.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Text(
                "NRH",
                style: TextStyle(
                    color: Color.fromARGB(179, 6, 51, 164),
                    fontWeight: FontWeight.bold,
                    fontSize: 46.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
