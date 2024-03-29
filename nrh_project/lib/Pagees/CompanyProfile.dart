import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nrh_project/Pagees/Settings.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
   Map<String, dynamic>? _userInfo;
  TextEditingController _companyController = TextEditingController();
  TextEditingController _domainController = TextEditingController();
  TextEditingController _dateofbirthController = TextEditingController();
  TextEditingController _adressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

 Future<void> _fetchUserInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  if (token == null) {
    // Handle token not found
    return;
  }

  try {
    final Map<String, dynamic> userInfo = Jwt.parseJwt(token);
    setState(() {
      _userInfo = userInfo;
      _companyController.text = _userInfo!['company'] ?? '';
      _domainController.text = _userInfo!['domain'] ?? '';
      _dateofbirthController.text = _userInfo!['dateofbirth'] ?? '';
      _adressController.text = _userInfo!['adress'] ?? '';
      _cityController.text = _userInfo!['city'] ?? '';
      _countryController.text = _userInfo!['country'] ?? '';
    });
  } catch (error) {
    print('Failed to decode token: $error');
    // Handle error
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

         body :SingleChildScrollView(
           child: Column(
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
                      'Company Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 8, 21, 158),
                          fontSize: 25),
                    ),
                  ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 40,left: 10),
                 child: Text('General informations',style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 8, 21, 158) ),),
               ),  
               Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Text(
                    'Company name',
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
                        controller: _companyController,
                        enabled: false,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Company name' ,
                          prefixIcon: const Icon(Icons.house_rounded) ,
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
                        controller: _domainController,
                        enabled: false,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Industry' ,
                          prefixIcon: const Icon(Icons.work_rounded) ,
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
                    'Anniversary',
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
                        controller: _dateofbirthController,
                        enabled: false,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Anniversary' ,
                          prefixIcon: const Icon(Icons.calendar_month_outlined) ,
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
                 padding: const EdgeInsets.only(top: 40,left: 10),
                 child: Text('Adress',style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 8, 21, 158) ),),
               ),
                  Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Adress',
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
                        controller: _adressController,
                        enabled: false,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Adress' ,
                          prefixIcon: const Icon(Icons.mail_lock_outlined) ,
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
                    'City',
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
                          hintText: 'City' ,
                          prefixIcon: const Icon(Icons.location_city_outlined) ,
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
                    'Country',
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
                        controller: _countryController,
                        enabled: false,
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),  
                          
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Country' ,
                          prefixIcon: const Icon(Icons.location_city_outlined) ,
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
         ),
         

    ));
  }
}