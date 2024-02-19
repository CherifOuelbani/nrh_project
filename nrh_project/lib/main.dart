import 'package:flutter/material.dart';
import 'components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/textfield.dart';
import 'components/pack.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title:const Text( "hello")),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Column(
          
         
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(color: const Color.fromRGBO(113, 82, 243,1),colortext:Colors.white , title: 'Sign in', onPressed: () {  }, ),
          ),
         Button(color: const Color.fromRGBO(128, 128, 128,0.1),colortext:const Color.fromRGBO(53, 28, 180, 1) , title: 'Log in', onPressed: () {  }, ),
         Textfield(hinttext: 'First name', icon: Icon(Icons.supervised_user_circle)),
         Pack(type :'Free', price: '0',feature: 'Voice messages anywhere'),
          ],
        ), 
        
      )));
    }}
    
