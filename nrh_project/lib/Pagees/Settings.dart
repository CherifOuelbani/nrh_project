import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/CompanyProfile.dart';
import 'package:nrh_project/Pagees/Login_Page.dart';
import 'package:nrh_project/Pagees/Personnal_info.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/Pagees/proffesional_Infi.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        bottomNavigationBar: Container(
          height: 80,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            showUnselectedLabels: true,
            selectedItemColor: Color.fromRGBO(113, 82, 243, 1),
            unselectedItemColor: const Color.fromARGB(255, 87, 87, 87),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.timer), label: "Pointer"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Social"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Absence"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: "Calendar"),
              BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Plus"),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 50),
              child: Text(
                "Settings",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 8, 21, 158),
                    fontSize: 27),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 40),
                  child: Column(
                    children: [
                      Container(
                        height: 68,
                        width: 372,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Color.fromRGBO(113, 82, 243, 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 17, left: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 25, right: 15),
                                  child: Icon(
                                    Icons.stars_rounded,
                                    size: 32,
                                    color: Colors.yellow,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Upgrade Plan To Unlock More !",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                        "enjoy all experience and explore more possibilities",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 566,
                          width: 372,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              MaterialButton(
                                onPressed: () {Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => CompanyProfile()),
                                  );},
                                color: Colors.white,
                                elevation: 0,
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.work_outline,
                                      size: 22,
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Spacer between icon and text
                                    Text(
                                      'Company Profile',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            134), // Spacer between text and icon
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => PersonnalInfo()),
                                  );
                                },
                                color: Colors.white,
                                elevation: 0,
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      size: 22,
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Spacer between icon and text
                                    Text(
                                      'Personnal information',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                        width:
                                            95), // Spacer between text and icon
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            ProffesionallInfo()),
                                  );
                                },
                                color: Colors.white,
                                elevation: 0,
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.work_outline,
                                      size: 22,
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Spacer between icon and text
                                    Text('Proffesionnal information',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            72), // Spacer between text and icon
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 10,
                                endIndent: 35,
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                elevation: 0,
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.notifications_active_outlined,
                                      size: 22,
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Spacer between icon and text
                                    Text(
                                      'Notifications',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                        width:
                                            158), // Spacer between text and icon
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                elevation: 0,
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.language_outlined,
                                      size: 22,
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Spacer between icon and text
                                    Text(
                                      'Language',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                        width:
                                            176), // Spacer between text and icon
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                elevation: 0,
                                height: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.pin_invoke_outlined,
                                      size: 22,
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Spacer between icon and text
                                    Text(
                                      'Open web version',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                        width:
                                            122), // Spacer between text and icon
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: Colors.red, width: 1.5),
                                  ),
                                  onPressed: () {
                                      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => Login(
        )),
      );
                                  },
                                  minWidth: 350,
                                  height: 57,
                                  child: Text(
                                    "Log out",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Lexend',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
