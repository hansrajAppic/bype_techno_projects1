import 'package:flutter/material.dart';

import 'package:paytm_apps/rechargr2_operate.dart';

class Recharge extends StatefulWidget {
  const Recharge({super.key});
  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: h * 0.2,
          ),
          Container(
            height: h * 0.16,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffFFFFFF),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(69, 143, 145, 135),
                    blurRadius: 4,
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Text(
                    "ll RECHARGE SERIVICE ll",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 248, 245, 245),
                          child: IconButton(
                            
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return ScaleTransition(
                                      alignment: Alignment.center,
                                      scale: Tween<double>(begin: 0.1, end: 1)
                                          .animate(
                                        CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.bounceIn,
                                        ),
                                      ),
                                      child: child,
                                    );
                                  },
                                  transitionDuration: Duration(seconds: 2),
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return RechargeOperator();
                                  },
                                ),
                              );
                            },

                            icon: Icon(
                              Icons.phone_iphone,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.14,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 248, 245, 245),
                        child: Image.asset(
                          "assets/images/dth-removebg-preview.png",
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.003,
                  ),
                  Row(
                    children: [
                      Text(
                        "Recharge",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: w * 0.12,
                      ),
                      Text(
                        "DTH",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
