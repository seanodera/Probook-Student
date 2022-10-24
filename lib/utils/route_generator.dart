import 'package:flutter/material.dart';
import 'package:probook_student/screens/error_page.dart';
import 'package:probook_student/screens/home.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute (RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name) {
      case '/' : return MaterialPageRoute(builder: (_) => const Home());
      case '/else': return MaterialPageRoute(builder: (_) => const Home());
      default: return MaterialPageRoute(builder: (_) => const ErrorPage());
    }

  }
}