import 'dart:io';
import 'package:nrh_project/Pagees/calendrier.dart';
import 'package:nrh_project/components/article.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/ADDarticle.dart';
import 'package:nrh_project/Pagees/Personnes_page.dart';
import 'package:nrh_project/components/NavBar.dart';

class Social extends StatefulWidget {
  const Social({super.key});
  static const String screenRoute = 'social';
  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  int _selectedIndex = 2;
  List<Article> articles = [];
  void initState() {
    super.initState();
    _selectedIndex = 1;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, Social.screenRoute);
    }
    if (index == 4) {
      Navigator.pushNamed(context, Personnes.screenRoute);
    }
    if (index == 3) {
      Navigator.pushNamed(context, calendrier.screenRoute);
    }
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
          backgroundColor: Color.fromARGB(249, 248, 248, 248),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 65, right: 25, bottom: 25),
                child: Row(
                  children: [
                    Text(
                      "Social",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 8, 21, 158),
                          fontSize: 28),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddArticle()),
                        );

                        if (result is Article) {
                          setState(() {
                            articles.add(result);
                          });
                        }
                      },
                      icon: Icon(
                        Icons.add_box,
                        color: Color.fromARGB(255, 8, 21, 158),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              for (var article
                  in articles.reversed) // Display newest articles first
                ArticleWidget(
                  article: article,
                ),
            ]),
          ),
        ));
  }
}
