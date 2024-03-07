import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nrh_project/Pagees/Sign_up_Step2.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:validators/validators.dart';


class MyDropdown extends StatelessWidget {
  final String dropdownValue;
  final void Function(String?)? onChanged;
  
  

  MyDropdown({required this.dropdownValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5 , left: 10),
      child: Container(
        height: 62,
        
        width: 390,
        decoration:  BoxDecoration(
        border: Border.all(color: Colors.grey,), // Border decoration
        borderRadius: BorderRadius.circular(20),
         // Rounded corners
      ),
        child: DropdownButton<String>(
          
          padding: EdgeInsets.only(left: 10,top: 5),
          value: dropdownValue,
          
          icon: Padding(
            padding: const EdgeInsets.only(left: 150, top: 10),
            child: const Icon(Icons.arrow_downward),
          ),
          iconSize: 20,
          underline: Container(),
          
          
          style: const TextStyle(color: Color.fromARGB(255, 106, 104, 104),fontSize: 16 ),
        
          onChanged: onChanged,
          items: <String>['Manager HR','Specialist HR','Service Informatique','Compatibilité','Equipe de gestion','Equipe des opérations', 'Je suis stagiaire']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child:  Row(
              children: [
                Icon(Icons.person, color:Color.fromARGB(255, 106, 104, 104) ,), // Add icon to the left
                SizedBox(width: 8), // Add some spacing between icon and text
                Text(value),
              ],),
             
            );
          }).toList(),
          
        ),
      ),
    );
  }
}
