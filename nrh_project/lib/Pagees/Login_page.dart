import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:nrh_project/Pagees/Reset_pswrd.dart';
import 'package:nrh_project/Pagees/welcome_page.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nrh_project/components/button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String screenRoute = 'Login_Page';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isChecked = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? validateEmail(String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<bool> login(String email, String password) async {
    final Uri url = Uri.parse('http://10.0.2.2:5000/api/login');
    try {
      final response = await http.post(
        url,
        headers: const {'Content-Type': 'application/json'},
        body: jsonEncode({'emailorcin': email, 'password': password}),
      );
      //print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final String token = responseData['token'];
        Navigator.popAndPushNamed(context, Personnes.screenRoute);

        Map<String, dynamic> userInfo = Jwt.parseJwt(token);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('userInfo', json.encode(userInfo));

        return true;
      } else {
        print("Login error: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception caught: $e");
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  void _loadCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');
    setState(() {
      _emailController.text = email ?? '';
      _passwordController.text = password ?? '';
    });
  }

  void _saveCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
  }

  @override
  void dispose() {
    _saveCredentials();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomeScreen.screenRoute);
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.transparent;
                          }
                          return null;
                        },
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 15),
                child: Text(
                  'Welcome Back',
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
                key: _formKey,
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
                          prefixIcon: Icon(Icons.email, color: Colors.grey),
                        ),
                        validator: validateEmail,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "enter your password",
                          prefixIcon: Icon(Icons.lock,
                              color: const Color.fromARGB(255, 225, 225, 225)),
                        ),
                        validator: (password) => password!.length < 8
                            ? 'please enter a valid password'
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 33, right: 0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        'Remember mee',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ResetPswrd.screenRoute);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Color.fromARGB(255, 8, 21, 158),
                            fontSize: 14),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.transparent;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      width: 150,
                      child: Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Container(
                      width: 150,
                      child: Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    width: 378,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/google 1.png",
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
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Button(
                  color: Color((0xFF7152F3)),
                  colortext: Color((0xFFFFFFFF)),
                  title: 'Log In',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      final bool isLoggedIn = await login(email, password);

                      if (isLoggedIn) {
                        print("good");
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Login Failed"),
                              content: Text(
                                  "Please enter a valid email or password."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
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
