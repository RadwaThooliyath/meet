import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meet/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 250,left: 55),
        child: Column(
          children: [
            Image.asset("assets/m.png",height: 200,width: 200,),
            SizedBox(height: 200,),
            Text("Google Workspace",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}



