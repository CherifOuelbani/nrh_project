import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/Pagees/Sign_up_Step4.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';

class sign_up_5 extends StatefulWidget {
  const sign_up_5({super.key});

  @override
  State<sign_up_5> createState() => _sign_up_5State();
}

class _sign_up_5State extends State<sign_up_5> {
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
                              builder: (context) => sign_up_4()),);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Set your Password',
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
                  padding: const EdgeInsets.only(left: 10, top: 90),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password' ,
                      prefixIcon: const Icon(Icons.password) ,
                      
                      
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'Please enter the Password';
                    }
                    return null ;
                  },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Re-enter Password',
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
                    obscureText: true,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password' ,
                      prefixIcon: const Icon(Icons.password) ,
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'Please enter the password';
                    }
                    return null ;
                  },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 200),
                child: Button(
                    color: Color.fromRGBO(113, 82, 243, 1),
                    colortext: Colors.white,
                    title: 'Finish',
                    onPressed: () {
                       if (_formKey.currentState!.validate()){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => sign_up_4()),);
                    };
                    }),
              ),
                    ],
                  ),
            ),
          )),
    );
  }
}
