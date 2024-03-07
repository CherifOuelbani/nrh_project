import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step3.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';

class sign_up_2 extends StatefulWidget {
  sign_up_2({super.key});

  @override
  State<sign_up_2> createState() => _sign_up_2State();
}

class _sign_up_2State extends State<sign_up_2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Sign_up_1()),);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Create your Account',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Elevate your HR managment with NRH',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: 'First name' ,
                    prefixIcon: const Icon(Icons.person) ,
                ),
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'Please enter first name';
                  }
                  return null ;
                },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: 'Second name' ,
                    prefixIcon: const Icon(Icons.person) ,
                ),
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'Please enter Second name';
                  }
                  return null ;
                },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: 'CIN' ,
                    prefixIcon: const Icon(Icons.card_membership) ,
                ),
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'Please enter Your CIN';
                  }
                  return null ;
                },
                ),
              ),
               
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 150),
                child: Button(
                    color: Color.fromRGBO(113, 82, 243, 1),
                    colortext: Colors.white,
                    title: 'Continue',
                    onPressed: () {
                       if (_formKey.currentState!.validate()){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => sign_up_3()),);
                       }
                      else{}
                    }),
              ),
                    ],
                  ),
            ),
          )),
    );
  }
}
