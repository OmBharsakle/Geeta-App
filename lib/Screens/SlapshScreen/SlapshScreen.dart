import 'dart:async';

import 'package:flutter/material.dart';

import '../Home/View/Home_Page.dart';

class SlapshScreen extends StatefulWidget {
  const SlapshScreen({super.key});

  @override
  State<SlapshScreen> createState() => _SlapshScreenState();
}

class _SlapshScreenState extends State<SlapshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/chapterImage/Slash.jpeg'),fit: BoxFit.cover)
        ),
      ),
    );
  }
}
