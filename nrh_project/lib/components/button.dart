import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  const Button({required this.color,required this.colortext ,required this.title,required this.onPressed});
final Color color;
final Color colortext;
final String title ;
final VoidCallback onPressed ;


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
        color: color,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 378,
          height: 55,
          child: Text(title,
          style: TextStyle(
            color:colortext,
            fontFamily: 'Lexend',
            fontSize:20,
            fontWeight: FontWeight.w400,
            ),),
          ),

    );
  }
}