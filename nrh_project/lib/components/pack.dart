import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/components/button.dart';


class Pack extends StatelessWidget {
  const Pack({required this.type ,required this.price ,required this.feature, required this.action , required this.color, required this.colortext});
  final String type ;
  final String price ;
  final String feature ;
  final String action  ;
  final Color color ;
  final Color colortext;
  
  @override
  Widget build(BuildContext context) {
    return Container(  
      height: 381,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),color: const Color.fromRGBO(113,82,243,1),),
      
      child: Column(children: [
        Row(
          children: [
                 Padding(
              padding: const EdgeInsets.fromLTRB(20,0,30,20),
              child: Text(type, style:
              TextStyle(fontWeight: FontWeight.bold , color: Colors.white, fontSize:30) ,),
            ),
            Padding(
              padding: const EdgeInsets.only(top :18),
              child: Material(
                
                  elevation: 1,
                    color: color,
                    borderRadius: BorderRadius.circular(25),
                    child: MaterialButton(
                      onPressed: (){},
                      minWidth: 150,
                      height: 46,
                      child: Text(action,
                      style: TextStyle(
              color:colortext,
              
              fontSize:20,
              fontWeight: FontWeight.w400,
              ),),
                      ),
            
                ),
            ),
       
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28,0,20,120),
          child: Row(
            children: [
              Text(price,  style:
          TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 30) ,) ,
          Text('DT',  style:
          TextStyle(fontWeight: FontWeight.bold , color: Colors.white,fontSize: 30) ,) ,
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