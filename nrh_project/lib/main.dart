import 'package:flutter/material.dart';
import 'components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/textfield.dart';
import 'components/pack.dart';
import 'Pagees/Sign_Up_Step1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sign_up_1();
  }
}
