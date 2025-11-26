import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:travel_buddy/screens/home_page.dart';

final theme = ThemeData().copyWith(
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    titleSmall: GoogleFonts.roboto(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.roboto(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.roboto(fontWeight: FontWeight.bold),
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: theme,
      home: HomePage(),
    );
  }
}
