import 'package:flutter/material.dart';
import 'package:paytm_apps/list_map.dart';

class DashBordScrren extends StatefulWidget {
  const DashBordScrren({super.key});

  @override
  State<DashBordScrren> createState() => _DashBordScrrenState();
}

class _DashBordScrrenState extends State<DashBordScrren> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var controller;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Stack(children: [
            Container(
              height: h * 0.56,
              decoration: const BoxDecoration(
                  // image: DecorationImage(

                  //   scale: 4,
                  //   image: AssetImage(
                  //     'assets/images/rsz_offer2x.png',
                  //   ),

                  // ),

                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffFFFFFF),
                  Color(0xff59B8BE),
                  Color(0xff59B8BE),
                ],
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.02, vertical: h * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 28,
                          ),
                          const Icon(
                            Icons.location_on_sharp,
                          ),
                          SizedBox(
                            width: w * 0.008,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your City",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 249, 248, 248)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Jaipur"),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: w * 0.1,
                          ),
                          Container(
                              height: h * 0.035,
                              width: w * 0.1,
                              decoration: BoxDecoration(
                                  color: const Color(0xff59B8BE),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/rsz_icon_awesome-wallet2x.png",
                                      height: 9,
                                    ),
                                    const Text(
                                      "₹200",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    )
                                  ])),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          Image.asset("assets/images/belicon.png"),
                          SizedBox(width: w * 0.01),
                          Image.asset("assets/images/language.png"),
                        ]),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                        labelText: "Services,........",
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 240, 235, 235)),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter check password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: w * 0, top: h * 0.02, left: w * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/rsz_offer2x.png",
                            height: 180,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "On your 1st recharge or app \n              Pay ₹1",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Image.asset("assets/images/rsz_bresh-shape.png"),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              SizedBox(
                                height: h * 0.044,
                                width: w * 0.15,
                                child: TextButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Text(
                                      "Click here",
                                      style:
                                          TextStyle(color: Color(0xffFFFFFF)),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: h * 0.60,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.43, left: 10, right: 4),
                      child: Container(
                        height: h * 0.01,
                        width: w * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color.fromARGB(255, 240, 236, 236),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(69, 143, 145, 135),
                                blurRadius: 6,
                              )
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.023, vertical: h * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Astro Keshav M.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: h * 0.004),
                                  const Text(
                                    "Exp: 10+ year",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff848484)),
                                  ),
                                  SizedBox(height: h * 0.004),
                                  const Text(
                                    "Tarot, Numerology, Prashna...",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff848484)),
                                  ),
                                  SizedBox(height: h * 0.004),
                                  const Text(
                                    "Language: Hindi, English",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff848484)),
                                  ),
                                  SizedBox(height: h * 0.004),
                                  const Text(
                                    "New user ₹40/min ₹60",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff59B8BE)),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/rsz_girls.png",
                                    height: 45,
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Container(
                                    height: h * 0.03,
                                    width: w * 0.13,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff59B8BE),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                        child: Center(
                                      child: Text(
                                        "Online",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                    )),
                                  ),
                                  SizedBox(height: h * 0.005),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/rsz_icon_ionic-ios-call.png"),
                                      SizedBox(
                                        width: w * 0.013,
                                      ),
                                      Image.asset(
                                          "assets/images/rsz_icon_awesome-video.png"),
                                      SizedBox(
                                        width: w * 0.013,
                                      ),
                                      Image.asset(
                                        "assets/images/rsz_chatb.png",
                                        height: 15,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ]),
          SizedBox(
            height: h * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.41),
            child: const Text(
              "See All",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  color: Color(0xff59B8BE)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Live Member",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: 50,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xffD9ECED),
                        maxRadius: 25,
                        child: Image.asset("assets/images/rsz_group_956.png"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 70, left: 12),
                      child: Text(
                        "Astrology..",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 52, left: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: h * 0.023,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff59B8BE),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Center(
                              child: Text(
                                "Live",
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xffFFFFFF)),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ]);
                }),
          ),
          // Container(
          //     height: h * 0.22,
          //     width: double.infinity,
          //     color: Color.fromARGB(255, 224, 194, 194),
          //     child: ListView.builder(
          //         itemBuilder: (BuildContext context, index) {
          //       return (Container());
          //     })),

          Container(
              height: h * 0.18,
              width: double.infinity,
              color: Color.fromARGB(255, 214, 192, 192),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: h * 0.02, vertical: w * 0.018),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: h * 0.11,
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            // return (Text(ArrayName[index]["title"]));
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 1),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.01,
                                          vertical: h * 0.0),
                                      child: (Image.asset(
                                        ArrayName[index]["image"],
                                      )),
                                    ),
                                    Text(
                                      ArrayName[index]["title"],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )),

          SizedBox(
            height: h * 0.1,
          ),
        ])));
  }
}
