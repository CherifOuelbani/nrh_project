import 'package:flutter/material.dart';

class Personne extends StatelessWidget {
  const Personne({
    required this.picture,
    required this.secondname,
    required this.firstname,
    required this.onPressed,
  });

  final ClipOval picture;
  final String firstname;
  final String secondname;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            picture,
            SizedBox(width: 20),
            Expanded(
              child: Text(
                '$firstname $secondname',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_sharp,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
