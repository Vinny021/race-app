import 'package:flutter/material.dart';
import 'package:race_app/app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Race App',
      home: HomePage(),
    );
  }
}
