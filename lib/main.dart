import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_dialysis_app/views/user_type_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '투석 관리 앱',
      theme: ThemeData(~
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
      home: UserTypeSelectionScreen(),
    );
  }
}~