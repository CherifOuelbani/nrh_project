import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Login_page.dart';
import 'package:nrh_project/Pagees/OTP.dart';
import 'package:nrh_project/Pagees/Reset_pswrd.dart';
import 'package:nrh_project/Pagees/ModifyPswrd.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:nrh_project/components/button.dart';

final _formKeyy = GlobalKey<FormState>();

class ResetPswrd extends StatefulWidget {
  const ResetPswrd({Key? key}) : super(key: key);
  static const String screenRoute = 'Reset_pswrd';
  @override
  _ResetPswrdState createState() => _ResetPswrdState();
}

class _ResetPswrdState extends State<ResetPswrd> {
  final _emailController = TextEditingController();

  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<void> sendOtp(String email, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/forgetpassword/sendotp'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        
        Navigator.pushNamed(
          context,
          OTPpage.screenRoute,
          arguments: {'email': email},
        );
      } else {
       
        final responseBody = json.decode(response.body);
        final errorMessage = responseBody['message'] ?? 'Failed to send OTP';
        _showDialog(context, 'Error', errorMessage);
      }
    } catch (e) {
      _showDialog(context, 'Error', 'An unexpected error occurred.');
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[],
        );
      },
    );
  }

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
                  padding: const EdgeInsets.only(top: 60, left: 15),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, Login.screenRoute);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  'Reset Your Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15),
                child: Text(
                  'Elevate your HR managment with NRH',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              Form(
                key: _formKeyy,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "enter your email",
                          prefixIcon: Icon(Icons.email,
                              color: Colors
                                  .grey), 
                        ),
                        validator: validateEmail,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
                child: Button(
                  color: Color((0xFF7152F3)),
                  colortext: Color((0xFFFFFFFF)),
                  title: 'Send code',
                  
                  onPressed: () {
                    if (_formKeyy.currentState!.validate()) {
                      
                      sendOtp(_emailController.text, context);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
