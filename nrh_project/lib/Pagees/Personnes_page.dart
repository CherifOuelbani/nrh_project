import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Profile.dart';
import 'package:nrh_project/Pagees/Social.dart';
import 'package:nrh_project/Pagees/calendrier.dart';
import 'package:nrh_project/components/personne.dart';
import 'package:nrh_project/components/NavBar.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nrh_project/Pagees/empprofile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Personnes extends StatefulWidget {
  const Personnes({Key? key}) : super(key: key);
  static const String screenRoute = 'Personne_page';

  @override
  _PersonnesState createState() => _PersonnesState();
}

class _PersonnesState extends State<Personnes> {
  Map<String, dynamic> data = {};
  int _selectedIndex = 0;
  List<dynamic> employees = [];

  @override
  void initState() {
    super.initState();
    _loadUserInformation();
    _fetchAndSetEmployees();
    _selectedIndex = 4;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, Social.screenRoute);
    }

    if (index == 3) {
      Navigator.pushNamed(context, calendrier.screenRoute);
    }
  }

  void _loadUserInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      setState(() {
        data = payload;
      });
    }
  }

 void _fetchAndSetEmployees() async {
  try {
    // Refresh the token
    await _refreshToken();

    // Fetch employees using the updated token
    final fetchedEmployees = await fetchEmployees();
    setState(() {
      employees = fetchedEmployees;
    });
  } catch (e) {
    print('Error fetching employees: $e');
    // Handle error, e.g., show an error message to the user
  }
}

Future<void> _refreshToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? refreshToken = prefs.getString('refreshToken');

  if (refreshToken != null) {
    final Uri url = Uri.parse('http://10.0.2.2:5000/api/refresh_token');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'refreshToken': refreshToken}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> tokenData = json.decode(response.body);
        final String newToken = tokenData['token'];

        // Save the new token
        prefs.setString('token', newToken);
      } else {
        print('Failed to refresh token. Status code: ${response.statusCode}.');
        throw Exception('Failed to refresh token');
      }
    } catch (e) {
      print('Exception caught while refreshing token: $e');
      throw Exception('Failed to refresh token: $e');
    }
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
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        backgroundColor: Color.fromARGB(251, 251, 251, 251),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 65, right: 25, bottom: 25),
                child: Row(
                  children: [
                    Text(
                      "Personnes",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 8, 21, 158),
                          fontSize: 28),
                    ),
                    Spacer(),
                    //IconButton(
                    //onPressed: () {},
                    // icon: Icon(Icons.add_box),
                    //),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 21.0, bottom: 23, left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 117, 133, 255)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 117, 133, 255)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 117, 133, 255)),
                    ),
                    hintText: "Sersch...",
                    prefixIcon:
                        Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, left: 20, right: 20),
                child: Personne(
                    picture: ClipOval(
                      child: Image.network(
                        'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                        height: 45,
                        width: 45,
                      ),
                    ),
                    firstname: "${data['firstname'] ?? 'Loading...'}",
                    secondname: "${data['lastname'] ?? 'Loading...'}",
                    onPressed: () {
                      Navigator.popAndPushNamed(context, Profile.screenRoute);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    var employee = employees[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Personne(
                          picture: ClipOval(
                            child: Image.network(
                              employee['imageUrl'] ??
                                  'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                              height: 45,
                              width: 45,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ),
                          ),
                          firstname: employee['firstname'] ?? 'Unknown',
                          secondname: employee['lastname'] ?? 'Unknown',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    empage(employeeData: employee),
                              ),
                            );
                          }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
