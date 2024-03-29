import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nrh_project/Pagees/Absences_1.dart';
import 'package:nrh_project/Pagees/CompanyProfile.dart';
import 'package:nrh_project/Pagees/Login_Page.dart';
import 'package:nrh_project/Pagees/Personnal_info.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';

import 'package:nrh_project/Pagees/Social.dart';
import 'package:nrh_project/Pagees/calendrier.dart';
import 'package:nrh_project/Pagees/proffesional_Infi.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});
  static const String screenRoute = 'Settings';
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   Map<String, dynamic>? _userInfo;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cinController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  int _selectedIndex = 0;
  bool _showAdditionalItems = false;

  void initState() {
    super.initState();
    _selectedIndex = 4;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
void didChangeDependencies() {
    super.didChangeDependencies();
   _fetchUserInfo();
  }
  
  Future<void> refreshUserInfo() async {
    await _fetchUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    void _showItemSelection(BuildContext context) {
      Widget _buildAdditionalItem(
          BuildContext context, IconData icon, String itemName, Color color) {
        return GestureDetector(
          onTap: () {
            if (itemName == 'Settings') {
              Navigator.pushNamed(context, Settings.screenRoute);
            } else if (itemName == 'Personnes') {
              Navigator.pushNamed(context, Personnes.screenRoute);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, color: Color.fromARGB(255, 87, 87, 87)),
              SizedBox(height: 4),
              Text(itemName,
                  style: TextStyle(color: Color.fromARGB(255, 87, 87, 87))),
            ],
          ),
        );
      }

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildAdditionalItem(context, Icons.settings, 'Settings',
                    Color.fromARGB(255, 87, 87, 87)),
                _buildAdditionalItem(context, Icons.person, 'Personnes',
                    Color.fromARGB(255, 87, 87, 87)),
              ],
            ),
          );
        },
      );
    }

    List<BottomNavigationBarItem> getBottomNavBarItems() {
      List<BottomNavigationBarItem> items = [
        BottomNavigationBarItem(
          icon: Icon(Icons.timer_outlined),
          label: "Pointer",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outlined),
          label: "Social",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Absence",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: "Calendar",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets_outlined),
          label: "Plus",
        ),
      ];

      return items;
    }

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
              onTap: (index) {
                if (index == 4) {
                  _showItemSelection(context);
                } else {
                  _onItemTapped(index);
                }
                if (index == 1) {
                  Navigator.pushNamed(context, Social.screenRoute);
                }

                if (index == 3) {
                  Navigator.pushNamed(context, calendrier.screenRoute);
                }
                if (index == 2) {
                  Navigator.pushNamed(context, Absence_1.screenRoute);
                }
              },
              backgroundColor: Colors.white,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              showUnselectedLabels: true,
              selectedItemColor: Color.fromRGBO(113, 82, 243, 1),
              unselectedItemColor: const Color.fromARGB(255, 87, 87, 87),
              items: getBottomNavBarItems(),
            ),
          ),
          body: SingleChildScrollView(
            // Wrap the Column in a SingleChildScrollView
            child: Column(
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
                      padding:
                          const EdgeInsets.only(left: 20, top: 40, right: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                color: Colors.white,
                                                fontSize: 10))
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
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                CompanyProfile()),
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
                                            builder: (context) =>
                                                PersonnalInfo()),
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
                                          CupertinoPageRoute(
                                              builder: (context) => Login()),
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
        ));
  }
}
