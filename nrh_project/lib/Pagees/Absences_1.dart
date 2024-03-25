import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:nrh_project/Pagees/RequestAbsence.dart';
import 'package:nrh_project/Pagees/Settings.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step3.dart';
import 'package:nrh_project/Pagees/Social.dart';
import 'package:nrh_project/Pagees/calendrier.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:http/http.dart' as http;

class Absence_1 extends StatefulWidget {
  const Absence_1({super.key});
  static const String screenRoute = 'absence';

  @override
  State<Absence_1> createState() => _Absence_1State();
}

class _Absence_1State extends State<Absence_1> {
  bool _showAdditionalItems = false;
  int _selectedIndex = 0;
  void initState() {
    super.initState();
    _selectedIndex = 2;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 15, bottom: 50),
                child: Text(
                  'Absences',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 15),
                child: Container(
                  height: 133,
                  width: 381,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 8),
                        child: Text(
                          "Month/Year",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Divider(
                          indent: 10,
                          endIndent: 35,
                          thickness: 0.5,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  '21.0',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromRGBO(113, 82, 243, 1)),
                                ),
                                Text(
                                  'Cumulative days',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(113, 82, 243, 1)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  '21.0',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromRGBO(113, 82, 243, 1)),
                                ),
                                Text(
                                  ' Available days',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(113, 82, 243, 1)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  '21.0',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromRGBO(113, 82, 243, 1)),
                                ),
                                Text(
                                  ' Days used',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(113, 82, 243, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Container(
                  height: 100,
                  width: 378,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 20, top: 10),
                        child: Text('Past Absences'),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 30,
                            ),
                            child: Icon(
                              Icons.calendar_month,
                              size: 26,
                            ),
                          ),
                          Text('Absences /duration'),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 300),
                child: Material(
                  elevation: 1,
                  color: Color.fromRGBO(113, 82, 243, 1),
                  borderRadius: BorderRadius.circular(8),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RequestAbsence()),
                      );
                    },
                    minWidth: 364,
                    height: 57,
                    child: Text(
                      'Request Leave or Absence',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
