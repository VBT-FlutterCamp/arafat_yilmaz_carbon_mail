import 'package:flutter/material.dart';
import 'package:mail_ui/feature/homeScreen/view/homeview.dart';
import 'package:mail_ui/feature/welcomeScreen/view/welcome_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: const Color(0xff293855),
      ),
      home: const WelcomeScreen(),
    );
  }
}
