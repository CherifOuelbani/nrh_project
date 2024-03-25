
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/Pagees/Sign_up_Step4.dart';
import 'package:nrh_project/Pagees/Sign_up_Step5.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:http/http.dart' as http;

class sign_up_3 extends StatefulWidget {
    final String email;
  final String role;
  final String firstName;
  final String lastName;
  final String cin;
   sign_up_3({super.key, required this.email, required this.role, required this.lastName, required this.firstName, required this.cin});

  @override
  State<sign_up_3> createState() => _sign_up_3State();
}

class _sign_up_3State extends State<sign_up_3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _namecontroller= TextEditingController();
  TextEditingController _domainecontroller = TextEditingController();
  TextEditingController _phonenumbercontroller = TextEditingController();
   String verificationphone='';
  Future<void> verifyphone() async {
  try {
    print('a');
    final url = 'http://10.0.2.2:5000/api/verifyphone'; 
    final response = await http.post(
      Uri.parse(url),
      body:  {
        'phonenumber': _phonenumbercontroller.text,
      },
      
    );
    print(response);
    if (response.statusCode == 200) {
      
      print('Response body: ${response.body}');
      print('Registration successful');
    } else {
      setState(() {
          verificationphone = 'Phone number is already token'; // Or use the message from API
        });
      
      print('Registration failed: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error connecting to the server: $e');
  }
}
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
                              builder: (context) => sign_up_2( email: '', 
          role: '')),);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Company Information',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 50),
                child: Text(
                  'Elevate your HR managment with NRH',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Company',
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
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Company' ,
                      prefixIcon: const Icon(Icons.house) ,
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'Please enter Company';
                    }
                    return null ;
                  },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Domain',
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
                    controller: _domainecontroller,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Domaine' ,
                      prefixIcon: const Icon(Icons.domain) ,
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'Please enter Domaine';
                    }
                    return null ;
                  },
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'phone',
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
                    controller: _phonenumbercontroller,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Phone' ,
                      prefixIcon: const Icon(Icons.phone) ,
                  ),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'Please enter your phone number';
                    }
                    return null ;
                  },
                  ),
                ),
              Padding(
  padding: const EdgeInsets.only(left: 15, top: 150),
  child: Builder(
    builder: (BuildContext context) {
      return Button(
        color: Color.fromRGBO(113, 82, 243, 1),
        colortext: Colors.white,
        title: 'Continue',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await verifyphone();
            if (verificationphone.isNotEmpty) {
              // If verification email is not empty, display message
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Phone number is unvalid'),
                    content: Text(verificationphone),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
             Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => sign_up_4(
                                  email: widget.email,
      role: widget.role,
      firstname: widget.firstName,
      lastname: widget.lastName,
      cin: widget.cin,
      comanyname :_namecontroller.text,
      domaine :_domainecontroller.text,
      phonenumber :_phonenumbercontroller.text),),);
            }
          }
        },
      );
    },
  ),
),

                    ],
                  ),
            ),
          )),
    );
  }
}
