import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Login_Page.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';

import 'package:http/http.dart' as http;
import '../components/Dropdown.dart';

class Sign_up_1 extends StatefulWidget {
  const Sign_up_1({super.key});

  @override
  State<Sign_up_1> createState() => _Sign_up_1State();
}

class _Sign_up_1State extends State<Sign_up_1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEmailCorrect = false;
  String dropdownValue = 'Manager HR';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dropdownController = TextEditingController();
  String verificationemail = "";
  Future<void> verifyemail() async {
    try {
      print('a');
      final url = 'http://10.0.2.2:5000/api/verifyemail';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': _emailController.text,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        print('Registration successful');
      } else {
        setState(() {
          verificationemail =
              'Email is already taken'; // Or use the message from API
        });

        print('Registration failed: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error connecting to the server: $e');
    }
  }

  void initState() {
    super.initState();
    _dropdownController.text = 'Manager HR'; // Initialize dropdown value
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
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {},
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Create your Account',
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
              padding: const EdgeInsets.only(top: 100, left: 10),
              child: Text(
                'Email',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      ;
                    });
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: isEmailCorrect == false
                          ? const Icon(
                              Icons.close_sharp,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                      iconColor: Colors.black,
                      focusedBorder: isEmailCorrect == false
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2))
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2))),
                  validator: (value) {
                    if (value!.isEmpty || (isEmailCorrect == false)) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Role',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            MyDropdown(
              dropdownValue: _dropdownController.text,
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownController.text = newValue!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 90),
              child: Row(
                children: [
                  Text('Already have an Account ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text('Login'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 210),
              child: Button(
                  color: Color.fromRGBO(113, 82, 243, 1),
                  colortext: Colors.white,
                  title: 'Continue',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await verifyemail();
                      if (verificationemail.isNotEmpty) {
                        // If verification email is not empty, display message
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Email Verification'),
                              content: Text(verificationemail),
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
                        // Proceed to the next step if email is valid and verification message is empty
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => sign_up_2(
                                  email: _emailController.text,
                                  role: _dropdownController.text)),
                        );
                      }
                    }
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
