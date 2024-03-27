import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nrh_project/Pagees/Settings.dart';

import 'package:shared_preferences/shared_preferences.dart';


class ProffesionallInfo extends StatefulWidget {
  const ProffesionallInfo({super.key});

  @override
  State<ProffesionallInfo> createState() => _ProffesionallInfoState();
}

class _ProffesionallInfoState extends State<ProffesionallInfo> {
  
   Map<String, dynamic>? _userInfo;
  TextEditingController _matriculeController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  @override
   void initState() {
    super.initState();
    _fetchUserInfo();
  }
  

 Future<void> _fetchUserInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  if (token == null) {
   
    return;
  }

  try {
    final Map<String, dynamic> userInfo = Jwt.parseJwt(token);
    setState(() {
      _userInfo = userInfo;
      _cityController.text = _userInfo!['city'] ?? '';
      _matriculeController.text = _userInfo!['matricule'] ?? '';
      _roleController.text = _userInfo!['role'] ?? '';
    });
  } catch (error) {
    print('Failed to decode token: $error');
   
  }
}
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
                        controller: _matriculeController,
                        enabled: false,
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
                        controller: _roleController,
                        enabled: false,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Role' ,
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
                        keyboardType: TextInputType.name,
                        controller: _cityController,
                        enabled: false,
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