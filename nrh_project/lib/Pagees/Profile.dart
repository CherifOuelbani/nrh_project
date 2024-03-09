import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const String screenRoute = 'Profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> employeeData = {};

  @override
  void initState() {
    super.initState();
    _fetchEmployeeData();
  }

  Future<void> _fetchEmployeeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      print("aaa");
      return;
    }

    final url = Uri.parse(
        'http://10.0.2.2:5000/api/models/user'); // Update with your actual endpoint
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        employeeData = responseData;
      });
    } else {
      // Handle the error case
      print('Failed to fetch employee data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(249, 248, 248, 248),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 55),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Personnes.screenRoute);
                          },
                          icon: Icon(Icons.arrow_back_ios, size: 25.0)),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                    child: Container(
                      width: 350,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 42),
                        child: Center(
                            child: Text(
                          "Joe Delgado",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 29.0, top: 17, bottom: 17),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Personal informations",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First Name: ${employeeData['firstname'] ?? 'Loading...'}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Last Name: ${employeeData['lastname'] ?? 'Loading...'}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Date of birth",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Text(
                              "CIN",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 78, 78, 78)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 29.0, top: 17, bottom: 17),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Porfissional Informations ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Manager",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Workplace",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(
                              height: 36,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 109,
                left: 155,
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'), // Replace with your image URL
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
