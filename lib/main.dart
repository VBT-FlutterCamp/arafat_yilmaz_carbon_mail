import 'package:flutter/material.dart';
import 'package:mail_ui/feature/welcomeScreen/view/welcome_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: WelcomeScreen(),
    );
  }
}