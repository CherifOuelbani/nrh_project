import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Settings.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:validators/validators.dart';

class PersonnalInfo extends StatefulWidget {
  const PersonnalInfo({super.key});

  @override
  State<PersonnalInfo> createState() => _PersonnalInfoState();
}

class _PersonnalInfoState extends State<PersonnalInfo> {
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
                    'Personnal Informations',
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
                    'First name',
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
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
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
                          hintText: 'Second name' ,
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
                    'Email',
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
                          hintText: 'Email' ,
                          prefixIcon: const Icon(Icons.email) ,
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
                    'CIN',
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
                          hintText: 'CIN' ,
                          prefixIcon: const Icon(Icons.card_membership_outlined) ,
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
                    'Phone number',
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
                          hintText: 'Phone number' ,
                          prefixIcon: const Icon(Icons.phone) ,
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
                    'Industry',
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
                          hintText: 'Role' ,
                          prefixIcon: const Icon(Icons.person_2_outlined) ,
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