import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/components/button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 9,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/team.png"))),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let’s get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xff2e386b),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Let’s dive in into your Account ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      color: Color(0xff2e386b),
                      fontSize: 23,
                    ),
                  )
                ],
              ),
              Spacer(
                  flex: 1), // Spacer to center the "Sign Up With Google" button
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: Colors.white, // Replace with your desired color
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width:
                      double.infinity, // Ensure the button takes the full width
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/google 1.png", // Replace with the actual path to your Google logo asset
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 50),
                      Text(
                        "Continue With Google",
                        style: TextStyle(
                          fontFamily: 'lexend',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                  flex: 1), // Spacer to center the "Sign Up With Google" button
              Button(
                color: Color((0xFF7152F3)),
                colortext: Color((0xFFFFFFFF)),
                title: 'Sign Up',
                onPressed: () {},
              ),
              SizedBox(height: 15),
              Button(
                color: Color((0xFFCCCCCC)),
                colortext: Color((0xFF7152F3)),
                title: 'Log In',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
