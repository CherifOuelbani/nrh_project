import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nrh_project/Pagees/Social.dart';
import 'package:nrh_project/components/article.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);
  static const String screenRoute = 'Addarticle';
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  File? _image;
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void dispose() {
 
    titleController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(253, 250, 250, 250),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 55, bottom: 50),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 25.0),
                      onPressed: () {
                        Navigator.pushNamed(context, Social.screenRoute);
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.transparent;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Ajouter un article',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 8, 21, 158),
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Title",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Color.fromARGB(255, 8, 21, 158),
                        fontSize: 18),
                  ),
                ),
              ),
              buildTextField(titleController, "Title"),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Date",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Color.fromARGB(255, 8, 21, 158),
                        fontSize: 18),
                  ),
                ),
              ),
              buildTextField(dateController, "Date"),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Color.fromARGB(255, 8, 21, 158),
                        fontSize: 18),
                  ),
                ),
              ),
              buildTextField(descriptionController, "Description", maxLines: 4),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: getImage,
                icon: Icon(Icons.add_a_photo),
                label: Text("Click to add photo"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(370, 50),
                ),
              ),
              SizedBox(height: 080),
              MaterialButton(
                minWidth: 370,
                height: 53,
               
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      dateController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    final article = Article(
                      title: titleController.text,
                      date: dateController.text,
                      description: descriptionController.text,
                      image: _image,
                    );
                    Navigator.pop(context, article);
                  }
                },
                child: Text("Add Article"),
                color: Color.fromARGB(255, 111, 116, 247),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hint, {int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    child: TextField(
      controller: controller, 
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}
}
