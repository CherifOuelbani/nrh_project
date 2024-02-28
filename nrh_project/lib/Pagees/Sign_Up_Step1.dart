import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_up_1 extends StatefulWidget {
  const Sign_up_1({super.key});

  @override
  State<Sign_up_1> createState() => _Sign_up_1State();
}

class _Sign_up_1State extends State<Sign_up_1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
  textTheme: GoogleFonts.lexendTextTheme(),
    ),
    home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only( top: 40),
            child: Icon(Icons.arrow_back_outlined),        
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Create your Account' , style:
            TextStyle(fontWeight:FontWeight.w900 ,color: Color.fromARGB(255, 8, 21, 158),
            fontSize: 30 ) 
            ,),
          ),
          Text('Elevate your HR managment with NRH' , style:
          TextStyle(fontWeight:FontWeight.w300 ,color: Colors.black,
          fontSize: 20 ) 
          ,)

        ],
      )

    ),);
  
  }
}