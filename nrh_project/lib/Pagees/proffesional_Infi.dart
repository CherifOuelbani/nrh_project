import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Settings.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:validators/validators.dart';

class ProffesionallInfo extends StatefulWidget {
  const ProffesionallInfo({super.key});

  @override
  State<ProffesionallInfo> createState() => _ProffesionallInfoState();
}

class _ProffesionallInfoState extends State<ProffesionallInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
  textTheme: GoogleFonts.lexendTextTheme(),
),
      home: Scaffold(
      
        backgroundColor: Color.fromRGBO(249, 249, 249,1),

         body :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Padding(
                          padding: const EdgeInsets.only(top: 40, left: 10),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_outlined),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => Settings()),);
                            },
                          )),
                          
                       Padding(
                  padding: const EdgeInsets.only(top: 38, left: 20),
                  child: Text(
                    'Professional Informations',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 8, 21, 158),
                        fontSize: 25),
                  ),
                ),
               ],
             ),
              Padding(
                  padding: const EdgeInsets.only(top:70, left: 20),
                  child: Text(
                    'Employee ID',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Employee ID' ,
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
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'Manager',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Manager' ,
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
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'Workplace',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 49,
                      width: 378,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Workplace' ,
                          prefixIcon: const Icon(Icons.place) ,
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
                  ),
                ),
              
           ],
           
         ),
         

    ));
  }
}