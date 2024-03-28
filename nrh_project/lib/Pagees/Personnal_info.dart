import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nrh_project/Pagees/Settings.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class PersonnalInfo extends StatefulWidget {
  const PersonnalInfo({super.key});

  @override
  State<PersonnalInfo> createState() => _PersonnalInfoState();
}

class _PersonnalInfoState extends State<PersonnalInfo> {
  Map<String, dynamic>? _userInfo;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cinController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  bool _isEditing = false;
  bool _isEnable = false;
 @override
void initState() {
  super.initState();
  _fetchUserInfo();
}

Future<void> _fetchUserInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  if (token == null) {
    // Handle token not found
    return;
  }

  try {
    final Map<String, dynamic> userInfo = Jwt.parseJwt(token);

    setState(() {
      _userInfo = userInfo;
      _firstNameController.text = _userInfo!['firstname'] ?? '';
      _lastNameController.text = _userInfo!['lastname'] ?? '';
      _emailController.text = _userInfo!['email'] ?? '';
      _cinController.text = _userInfo!['cin'] ?? '';
      _phoneNumberController.text = _userInfo!['phonenumber'] ?? '';
      _roleController.text = _userInfo!['role'] ?? '';
    });
  } catch (error) {
    print('Failed to decode token: $error');
    // Handle error
  }
  
}

Future<void> refreshUserInfo() async {
  // Call your method to fetch user information
  await _fetchUserInfo();
}

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  // Call the method to refresh user information
  refreshUserInfo();
}

void _saveChanges() async {
  // Get the edited values from the text field controllers
  String firstname = _firstNameController.text;
  String lastname = _lastNameController.text;
  String email = _emailController.text;
  String cin = _cinController.text;
  String phoneNumber = _phoneNumberController.text;
  String role = _roleController.text;

  // Perform API call to update user info
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      // Handle token not found
      return;
    }

    final response = await http.put(
      Uri.parse('http://10.0.2.2:5000/api/update/personalinformation'), // Provide your update API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(<String, dynamic>{
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'cin': cin,
        'phoneNumber': phoneNumber,
        'role': role,
        // Add other fields as necessary
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('Response from server: $responseData');
        final String token = responseData['token'];
       

        Map<String, dynamic> userInfo = Jwt.parseJwt(token);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('userInfo', json.encode(userInfo));

      // Update successful, handle success scenario
      setState(() {
        _firstNameController.text = responseData['firstname'] ?? '';
        _lastNameController.text = responseData['lastname'] ?? '';
        _emailController.text = responseData['email'] ?? '';
        _cinController.text = responseData['cin'] ?? '';
        _phoneNumberController.text = responseData['phoneNumber'] ?? '';
        _roleController.text = responseData['role'] ?? '';
        _isEditing = false;

        // Exit editing mode after saving changes
      });
      

      // Fetch updated user information to ensure it's up-to-date
      await refreshUserInfo();

      print('Updated!');
    } else {
      // Update failed, handle failure scenario
      print('Failed to update user info: ${response.body}');
    }
  } catch (error) {
    print('Failed to update user info: $error');
    // Handle error
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
          backgroundColor: Color.fromRGBO(249, 249, 249, 1),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Settings()),
                            );
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 38, left: 20),
                      child: Text(
                        'Personnal Informations',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 8, 21, 158),
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Text(
                    'First name',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _firstNameController,
                        enabled: _isEnable,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'First name',
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'Second name',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        enabled: _isEnable,
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Second name',
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'CIN',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        enabled: false,
                        controller: _cinController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'CIN',
                          prefixIcon:
                              const Icon(Icons.card_membership_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'Phone number',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        enabled: false,
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Phone number',
                          prefixIcon: const Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'Role',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _roleController,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Role',
                          prefixIcon: const Icon(Icons.person_2_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 20),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing;
                            _isEnable = !_isEnable;
                            // Toggle editing mode
                          });
                        },
                        child: Text(_isEditing ? 'Cancel' : 'Edit'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_isEditing) {
                              _saveChanges();
                               
                            }
                            
                          },
                          child: Text('Save Changes'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
