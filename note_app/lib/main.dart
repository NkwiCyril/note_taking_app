import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/screens/notes_display_screen.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(80, 51, 109, 0),
  ),
  textTheme: GoogleFonts.figtreeTextTheme()
  // cardTheme: const CardTheme().copyWith(
  //   color: const Color.fromRGBO(248, 242, 255, 0),
  // )
);

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const NotesDisplayScreen(),
      themeMode: ThemeMode.system,
    );
  }
}
