import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/Pagees/Sign_up_Step3.dart';
import 'package:nrh_project/Pagees/Sign_up_Step4.dart';
import 'package:nrh_project/Pagees/Sign_up_Step5.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:http/http.dart' as http;

class sign_up_4 extends StatefulWidget {
     final String   email;
      final String   role;
       final String   firstname;
        final String   lastname;
         final String   cin;
          final String   comanyname;
           final String   domaine;
            final String   phonenumber;
      
   sign_up_4({super.key, required this.email, required this.role, required this.firstname, required this.lastname, required this.cin,   required this.phonenumber, required this.domaine, required this.comanyname});

  @override
  State<sign_up_4> createState() => _sign_up_4State();
}

class _sign_up_4State extends State<sign_up_4> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordStrong(String password) {
  // Password must contain at least 8 characters, including uppercase letters,
  // lowercase letters, numbers, and special characters.
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);}
  TextEditingController _Passwordcontroller= TextEditingController();
  TextEditingController _confirmpasswordcontroller= TextEditingController();
   bool _obscureText = true;
   Future<void> registerUser() async {
    try {
      final url = 'http://10.0.2.2:5000/api/register'; // Replace with your API endpoint
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': widget.email,
          'role': widget.role,
          'firstname': widget.firstname,
          'lastname': widget.lastname,
          'cin': widget.cin,
          'password': _Passwordcontroller.text,
          'comanyname': widget.comanyname, 
        'domaine': widget.domaine, 
        'phonenumber': widget.phonenumber,
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
      } else {
        // Registration failed
        print('Registration failed: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Error connecting to the server
      print('Error connecting to the server: $e');
    }
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
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => sign_up_3(
                                email: '', 
          role: '', firstName: '',lastName: '',cin: '',
                              )),);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Set your Password',
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
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password' ,
                      prefixIcon: const Icon(Icons.lock) ,
                      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
         onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },)
                      
                      
                  ),
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
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password' ,
                      prefixIcon: const Icon(Icons.password) ,
                      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
         onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },)
                  ),
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
        if (_Passwordcontroller.text != _confirmpasswordcontroller.text) {
          // Show error message if passwords don't match
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Passwords do not match'),
                content: Text('Please make sure both passwords are the same.'),
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
          // If passwords match, proceed with registration
          registerUser();
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => sign_up_5(),
            ),
          );
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
