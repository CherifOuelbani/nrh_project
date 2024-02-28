import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/components/button.dart';

class Sign_up_1 extends StatefulWidget {
  const Sign_up_1({super.key});

  @override
  State<Sign_up_1> createState() => _Sign_up_1State();
}

class _Sign_up_1State extends State<Sign_up_1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
  textTheme: GoogleFonts.lexendTextTheme(),
    ),
    home: Scaffold(
      body:Button(color: const Color.fromRGBO(113, 82, 243,1),colortext:Colors.white , title: 'Sign in', onPressed: () {  }, ),

    ),);
  
  }
}