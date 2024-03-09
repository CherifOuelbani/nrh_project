import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Profile.dart';
import 'package:nrh_project/components/personne.dart';
import 'package:nrh_project/components/NavBar.dart';

class Personnes extends StatefulWidget {
  const Personnes({Key? key}) : super(key: key);
  static const String screenRoute = 'Personnes_page';
  @override
  _PersonnesState createState() => _PersonnesState();
}

class _PersonnesState extends State<Personnes> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        backgroundColor: Color.fromARGB(249, 249, 249, 249),
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
                    // Adjust the vertical padding to reduce the height of the TextFormField
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10.0), // Reduced vertical padding
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
                  firstname: 'Joe',
                  secondname: 'Delgado',
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.screenRoute);
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 500,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    children: [
                      Personne(
                        picture: ClipOval(
                          child: Image.network(
                            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                            height: 45,
                            width: 45,
                          ),
                        ),
                        firstname: 'Joe',
                        secondname: 'delgado',
                        onPressed: () {},
                      ),
                      Personne(
                        picture: ClipOval(
                          child: Image.network(
                            'https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-focus-face.jpg?auto=avif,webp&format=jpg&width=944',
                            height: 45,
                            width: 45,
                          ),
                        ),
                        firstname: 'Sarra',
                        secondname: 'Doe',
                        onPressed: () {},
                      ),
                      Personne(
                        picture: ClipOval(
                          child: Image.network(
                            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                            height: 45,
                            width: 45,
                          ),
                        ),
                        firstname: 'John',
                        secondname: 'Doe',
                        onPressed: () {},
                      ),
                      Personne(
                        picture: ClipOval(
                          child: Image.network(
                            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                            height: 45,
                            width: 45,
                          ),
                        ),
                        firstname: 'John',
                        secondname: 'Doe',
                        onPressed: () {},
                      ),
                    ],
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
