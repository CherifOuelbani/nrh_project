import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({required this.hinttext ,required this.icon});
  final String hinttext;
  final Icon icon ;
  

  @override
  Widget build(BuildContext context) {
    return Material( 
        
        color: Colors.white,
         
        
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: hinttext ,
              prefixIcon: icon ,
              iconColor:  Colors.grey,
              
            ),
            
        
          ),
        ) ,);
  }
}