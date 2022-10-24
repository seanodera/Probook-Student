import 'package:flutter/material.dart';
import 'package:probook_student/screens/mainshell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryDark = Color.fromARGB(255, 21,21,23,);

    return MaterialApp(
      title: 'Probook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: primaryDark,
          primaryColor: primaryDark,
          primaryColorBrightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            brightness: Brightness.dark
          ),
          cardColor: primaryDark,
          colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: primaryDark,
              onPrimary: Colors.white,
              secondary: Colors.redAccent.shade400,
              onSecondary: Colors.white,
              error: Colors.amberAccent.shade400,
              onError: Colors.black,
              background: primaryDark,
              onBackground: Colors.black38,
              surface: Colors.black,
              onSurface: Colors.white38)),
      home: const MainShell(),
    );
  }
}
