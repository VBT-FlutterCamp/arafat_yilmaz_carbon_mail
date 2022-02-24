import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Stack(
      children: <Widget>[
        Image.asset("assets/images/welcome_logo.png",height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,),
        Scaffold(git init
          body: Column(
            children: [
              Text("data"),
            ],
          ),
        ),
      ],
    );*/Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/welcome_logo.png"),
      fit: BoxFit.cover,
    ),
  ),
  child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("data"),
      ],
    ),
),);
  }
}