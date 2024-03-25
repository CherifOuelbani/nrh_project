import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';

class empage extends StatefulWidget {
  final Map<String, dynamic> employeeData;
  const empage({Key? key, required this.employeeData}) : super(key: key);
  static const String screenRoute = 'empprofile';
  @override
  State<empage> createState() => _empageState();
}

class _empageState extends State<empage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> employeeData = widget.employeeData;
    return MaterialApp(debugShowCheckedModeBanner: false,
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
                              "${widget.employeeData['lastname'] ?? 'Loading...'}",
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
                      'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'), // Replace with your image URL
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
