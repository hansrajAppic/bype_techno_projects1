import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paytm_apps/home_nave.dart';

class CackefizeSpleshScreen extends StatefulWidget {
  const CackefizeSpleshScreen({super.key});

  @override
  State<CackefizeSpleshScreen> createState() => _SpleshScrrenState();
}

class _SpleshScrrenState extends State<CackefizeSpleshScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeNaveScreen(
                    index: 0,
                  )));
    });
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.32,
            ),
            Center(
              child: Image.asset(
                "assets/images/SomanFizee.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 230,
            ),
          ]),
    );
  }
}
