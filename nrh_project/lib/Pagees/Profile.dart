import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jwt_decode/jwt_decode.dart';

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
    _loadUserInformation();
    fetchEmployees();
    
  }

  void _loadUserInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      setState(() {
        employeeData = payload;
      });
    }
  }
 

  Future<List<dynamic>> fetchEmployees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("Token: $token");
    final Uri url = Uri.parse('http://10.0.2.2:5000/api/employees/');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '$token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> employees = json.decode(response.body)['employees'];
        return employees;
      } else {
        print(
            'Failed to load employees. Status code: ${response.statusCode}. Response body: ${response.body}');
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load employees: $e');
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${employeeData['firstname'] ?? 'Loading...'}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${employeeData['lastname'] ?? 'Loading...'}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
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
                        "Personal informations",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 365,
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
                              "First Name",
                              style: TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['firstname'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 18),
                          
                            Text(
                              "Last Name",
                              style: TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['lastname'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 18),
                            
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['dateofbirth'] ?? 'Loading...'}", 
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 18),
                            Text(
                              "CIN",
                              style: TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['cin'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 18),
                           
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['phonenumber'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
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
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 240,
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
                              "Role",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['role'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['email'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Company",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${employeeData['company'] ?? 'Loading...'}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                ],
              ),
              Positioned(
                top: 109,
                left: 155,
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
