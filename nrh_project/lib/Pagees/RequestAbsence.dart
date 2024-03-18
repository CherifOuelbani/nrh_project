import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nrh_project/Pagees/Absences_1.dart';
import 'package:nrh_project/Pagees/Login_Page.dart';
import 'package:nrh_project/Pagees/Sign_Up_Step1.dart';
import 'package:nrh_project/Pagees/Sign_up_Step3.dart';
import 'package:nrh_project/components/button.dart';
import 'package:nrh_project/components/textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class RequestAbsence extends StatefulWidget {
  const RequestAbsence({super.key});

  @override
  State<RequestAbsence> createState() => _RequestAbsenceState();
}

class _RequestAbsenceState extends State<RequestAbsence> {
  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now();

  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _fromDate) {
      setState(() {
        _fromDate = pickedDate;
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _toDate,
      firstDate: _fromDate,
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _toDate) {
      setState(() {
        _toDate = pickedDate;
      });
    }
  }

  String _selectedOption = 'Paid Vacation';
  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Paid Vacation'),
                onTap: () {
                  setState(() {
                    _selectedOption = 'Paid Vacation';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sickness Leave'),
                onTap: () {
                  setState(() {
                    _selectedOption = 'Sickness Leave';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Parental Leave'),
                onTap: () {
                  setState(() {
                    _selectedOption = 'Parental Leave';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Family Bereavement'),
                onTap: () {
                  setState(() {
                    _selectedOption = 'Family Bereavement';
                  });
                  Navigator.pop(context);
                },
              ),
              // Add more options as needed
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedFromDate = DateFormat('dd/MM/yy').format(_fromDate);
    String formattedToDate = DateFormat('dd/MM/yy').format(_toDate);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Absence_1()),
                          );
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 38, left: 50),
                    child: Text(
                      'Request Absence',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 8, 21, 158),
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Container(
                  height: 228,
                  width: 366,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Absence type",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              TextButton(
                                  onPressed: () {
                                    _showOptions(context);
                                  },
                                  child: Text(
                                    ' $_selectedOption',
                                    selectionColor: Colors.black,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  )),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 145,
                            width: 316,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 188, 188, 188))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: TextField(
                                keyboardType: TextInputType.name,

                                maxLines:
                                    null, // Allows for multiple lines of text
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Description'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          Container(
                            height: 49,
                            width: 366,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(21),
                                    topRight: Radius.circular(21)),
                                color: const Color.fromRGBO(235, 230, 255, 1)),
                            child: MaterialButton(
                              onPressed: () => _selectFromDate(context),
                              child: Row(
                                children: [
                                  Text('From'),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Text(formattedFromDate),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 49,
                            width: 366,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(21),
                                    bottomRight: Radius.circular(21)),
                                color: const Color.fromRGBO(235, 230, 255, 1)),
                            child: MaterialButton(
                              onPressed: () => _selectToDate(context),
                              child: Row(
                                children: [
                                  Text('To'),
                                  SizedBox(
                                    width: 220,
                                  ),
                                  Text(formattedToDate),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              height: 57,
                              width: 364,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(235, 230, 255, 1),
                              ),
                              child: MaterialButton(
                                onPressed: _pickFile,
                                child: Row(
                                  children: [
                                    Icon(Icons.file_copy),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Text('Select File'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          if (_selectedFile != null)
                            Text(
                              'Selected File: ${_selectedFile!.path}',
                              style: TextStyle(fontSize: 16),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 170),
                            child: Material(
                              elevation: 1,
                              color: Color.fromRGBO(113, 82, 243, 1),
                              borderRadius: BorderRadius.circular(8),
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: 364,
                                height: 57,
                                child: Text(
                                  'Save changes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Lexend',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
