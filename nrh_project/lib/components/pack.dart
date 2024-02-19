import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pack extends StatelessWidget {
  const Pack({required this.type ,required this.price ,required this.feature });
  final String type ;
  final String price ;
  final String feature ;
  
  @override
  Widget build(BuildContext context) {
    return Container(  
      height: 381,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),color: const Color.fromRGBO(113,82,243,1),),
      
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,220,20),
          child: Text(type, style:
          TextStyle(fontWeight: FontWeight.bold , color: Colors.white, fontSize:40) ,),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28,0,20,120),
          child: Row(
            children: [
              Text(price,  style:
          TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 35) ,) ,
          Text('DT',  style:
          TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 35) ,) ,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.verified, color: Colors.white,),
              ),
              Text(feature,  style:
          TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 20) ,) ,
        
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.verified, color: Colors.white),
              ),
              Text(feature,  style:
                  TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 20) ,) ,
          
            ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.verified, color: Colors.white),
              ),
              Text(feature,  style:
                  TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 20) ,) ,
          
            ],
                  ),
          ),
        


      ]),
    )
    ;
  }
}