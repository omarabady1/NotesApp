import 'package:flutter/material.dart';
import 'package:notes_app/views/homescreen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff242329),
        fontFamily: 'Lato'
      ),
      home: Homescreen(),
    );
  }
}

