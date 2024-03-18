import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/Pagees/Sign_up_Step3.dart';
import 'package:nrh_project/Pagees/Sign_up_Step4.dart';
import 'package:nrh_project/Pagees/Sign_up_Step5.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/pack.dart';
import 'package:nrh_project/components/textfield.dart';

class sign_up_5 extends StatefulWidget {
   sign_up_5({super.key, });

  @override
  State<sign_up_5> createState() => _sign_up_5State();
}

class _sign_up_5State extends State<sign_up_5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                      
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Choose your Pack',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 8, 21, 158),
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Elevate your HR managment with NRH',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 60),
              child: Pack(type: 'For Free', 
              price: '0',
               feature: 'here is you features', 
               action: 'Already using', color: Colors.white, colortext: const Color.fromARGB(255, 68, 68, 68)),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Pack(type: 'Premium', 
              price: '9.99',
               feature: 'here is you features', 
               action: 'Buy now', color:  Colors.white, colortext: Color.fromRGBO(113, 82, 243, 1)),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Pack(type: 'Business', 
              price: '29.99',
               feature: 'here is you features', 
               action: 'Buy now', color:  Colors.white, colortext: Color.fromRGBO(113, 82, 243, 1)),
               
            ),
             Padding(
            padding: const EdgeInsets.only(left: 15, top: 50, bottom: 20),
            child: Button(
                color: Color.fromRGBO(113, 82, 243, 1),
                colortext: Colors.white,
                title: 'Continue',
                onPressed: () {
                   Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => sign_up_5()),);
                }),
          ),
                  ],
                ),
          )),
    );
  }
}
