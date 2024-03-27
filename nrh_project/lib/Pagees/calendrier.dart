import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Absences_1.dart';
import 'package:nrh_project/components/NavBar.dart';
import 'package:nrh_project/Pagees/Social.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:table_calendar/table_calendar.dart';

class calendrier extends StatefulWidget {
  const calendrier({super.key});
  static const String screenRoute = 'calendier';
  @override
  State<calendrier> createState() => _calendrierState();
}

class _calendrierState extends State<calendrier> {
  int _selectedIndex = 0;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 3;
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
    if (index == 2) {
      Navigator.pushNamed(context, Absence_1.screenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        backgroundColor: Color.fromARGB(253, 250, 250, 250),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 65, right: 25, bottom: 25),
              child: Row(children: [
                Text(
                  "Calendrier",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 28),
                )
              ]),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
                child: Container(
                    height: 550,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromARGB(255, 202, 202, 202),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              "Personnes en congé :",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )))
          ]),
        ),
      ),
    );
  }
}
