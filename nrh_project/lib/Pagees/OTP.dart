import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/ModifyPswrd.dart';
import 'package:nrh_project/Pagees/Reset_pswrd.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/Pagees/OTP.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OTPpage extends StatefulWidget {
  final String email;
  const OTPpage({Key? key, required this.email}) : super(key: key);
  static const String screenRoute = 'OTP';

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  List<String> _otpDigits = List.filled(6, '');

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  Future<void> verifyOtp() async {
    final String otp = _otpDigits.join();
    final String apiUrl =
        "http://10.0.2.2:5000/api/forgetpassword/verifyotp"; // Corrected URL
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': widget.email,
        'token': otp,
      }),
    );

    // The rest of your method remains unchanged...

    if (response.statusCode == 200) {
      // Handle success
      Navigator.pushNamed(
        context,
        Modify.screenRoute,
        arguments: {'email': widget.email},
      );
    } else {
      // Handle failure
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to verify OTP"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 60, left: 15),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, ResetPswrd.screenRoute);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: Text(
                  'Enter OTP code',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 8, 21, 158),
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15),
                child: Text(
                  'Check your email inbox for the OTP code we sent you .Please enter it below to proceed with the password reset',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(context, 0),
                        _textFieldOTP(context, 1),
                        _textFieldOTP(context, 2),
                        _textFieldOTP(context, 3),
                        _textFieldOTP(context, 4),
                        _textFieldOTP(context, 5),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 55),
                child: Button(
                  color: Color((0xFF7152F3)),
                  colortext: Color((0xFFFFFFFF)),
                  title: 'Continue',
                  onPressed: () {
                    verifyOtp();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP(BuildContext context, int index) {
    return Flexible(
      // Wrap in a Flexible widget
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4), // Add margin for spacing
        // Adjust the height if necessary
        child: AspectRatio(
          aspectRatio: 0.8, // Adjust the aspect ratio for a better fit
          child: TextFormField(
            focusNode: _focusNodes[index],
            autofocus: index == 0,
            onChanged: (value) {
              if (value.length == 1 && index < _focusNodes.length - 1) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              }
              if (value.length == 0 && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
              _otpDigits[index] = value;
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: const Color.fromARGB(255, 60, 39, 176)),
                  borderRadius: BorderRadius.circular(12)),
              fillColor: Color.fromARGB(255, 182, 182, 182),
            ),
          ),
        ),
      ),
    );
  }
}
