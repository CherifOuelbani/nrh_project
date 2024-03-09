import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Login_page.dart';
import 'package:nrh_project/Pagees/OTP.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nrh_project/Pagees/Login_page.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Modify extends StatefulWidget {
  const Modify({super.key});
  static const String screenRoute = 'ModifyPswrd';
  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  TextEditingController _Passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  String? userEmail; // Add this line to store the email

  @override
  void initState() {
    super.initState();
    // Assuming you're using Future.delayed to wait for the context to be available
    // This is a workaround to access context in initState
    Future.delayed(Duration.zero, () {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      userEmail = arguments['email']; // Retrieve and store the email
    });
  }

  bool _isPasswordStrong(String password) {
    // Password must contain at least 8 characters, including uppercase letters,
    // lowercase letters, numbers, and special characters.
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  bool _obscureText = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, OTPpage.screenRoute);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Secure your Account',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Almost there ! Create your new password',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 90),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _Passwordcontroller,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else if (!_isPasswordStrong(value)) {
                      return 'Password must contain at least 8 characters, including uppercase letters, lowercase letters, numbers, and special characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Re-enter Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _confirmpasswordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else if (!_isPasswordStrong(value)) {
                      return 'Password must contain at least 8 characters,\n including uppercase letters, lowercase letters, numbers \n, and special characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 200),
                child: Button(
                  color: Color.fromRGBO(113, 82, 243, 1),
                  colortext: Colors.white,
                  title: 'Finish',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_Passwordcontroller.text !=
                          _confirmpasswordcontroller.text) {
                        // Show error message if passwords don't match
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Passwords do not match'),
                              content: Text(
                                  'Please make sure both passwords are the same.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        try {
                          final response = http.post(
                            Uri.parse(
                                'http://10.0.2.2:5000/api/forgetpassword/changepassword'),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'email': userEmail!, // Use the userEmail here
                              'password': _Passwordcontroller.text,
                            }),
                          );

                          // Handle the response (success or failure) as shown in the previous instructions
                          // ...
                        } catch (e) {
                          // Handle unexpected errors
                          // ...
                        }
                        Navigator.popAndPushNamed(context, Login.screenRoute);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
