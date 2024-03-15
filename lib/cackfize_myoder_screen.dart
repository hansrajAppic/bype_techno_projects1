import 'package:flutter/material.dart';

class CackeFizeMyOder extends StatefulWidget {
  const CackeFizeMyOder({super.key});

  @override
  State<CackeFizeMyOder> createState() => _CackeFizeMyOderState();
}

class _CackeFizeMyOderState extends State<CackeFizeMyOder> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 4,
          backgroundColor: Colors.white,
          toolbarHeight: 40,
          // leading: Icon(Icons.arrow_back),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Image.asset(
            "assets/images/Cacke-removebg-preview.png",
            height: 25,
          ),
          actions: [
            const Icon(Icons.more_vert),
            SizedBox(
              width: w * 0.05,
            ),
          ]),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: h * 0.46,
              width: double.infinity,
              color: const Color.fromARGB(255, 165, 173, 186),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 95,
                    color: Colors.yellow,
                  ),
                  Text(
                    "You havent Placed Any Oder",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.38,
                ),
                SizedBox(
                  width: w * 0.55,
                  height: h * 0.0700,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.green),
                      child: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: const Text(
                            "START SHOPPING",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )),
                ),
              ],
            )
          ]),
    );
  }
}
