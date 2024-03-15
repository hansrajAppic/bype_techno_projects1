import 'package:flutter/material.dart';
import 'package:paytm_apps/home_nave.dart';

class CackefizeLogouctScrreen extends StatefulWidget {
  const CackefizeLogouctScrreen({super.key});

  @override
  State<CackefizeLogouctScrreen> createState() =>
      _CackefizeLogouctScrreenState();
}

class _CackefizeLogouctScrreenState extends State<CackefizeLogouctScrreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Center(
            child: Image.asset(
              "assets/images/SomanFizee.png",
              height: 200,
            ),
          ),
          Text(
            "We deliver our best at affordable cost",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: h * 0.12,
          ),
          SizedBox(
            width: w * 0.45,
            height: h * 0.0700,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.orange),
                child: Text(
                  "LOGIN / SIGNUP",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreen(
                          index: 0,
                        )),
              );
            },
            child: Text(
              "DO it latter",
              style: TextStyle(fontSize: 16),
            ),
          )
        ]));
  }
}
