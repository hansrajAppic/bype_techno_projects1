import 'package:flutter/material.dart';
import 'package:paytm_apps/home_nave.dart';
import 'package:paytm_apps/list_map.dart';

// ignore: camel_case_types
class CackeFizeOffers_screen extends StatefulWidget {
  const CackeFizeOffers_screen({super.key});

  @override
  State<CackeFizeOffers_screen> createState() => _CackeFizeOffers_screenState();
}

// ignore: camel_case_types
class _CackeFizeOffers_screenState extends State<CackeFizeOffers_screen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 40,
          // leading: Icon(Icons.arrow_back),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeNaveScreen(
                          index: 0,
                        )),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Column(
            children: [
              Image.asset(
                "assets/images/Cacke-removebg-preview.png",
                height: 25,
              ),
            ],
          ),
          actions: [
            const Icon(Icons.more_vert),
            SizedBox(
              width: w * 0.05,
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: h * 0.1,
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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available Offers",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "AvailableCoupons During Cheackout",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: OffersArrayName.length,
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          8,
                        ),
                        child: (Container(
                          height: h * 0.29,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 235, 224, 224)),
                              color: const Color(0xffFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.03, vertical: h * 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.12,
                                ),
                                Text(
                                  OffersArrayName[index]["title2"],
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: h * 0.024,
                                            child: const CircleAvatar(
                                              maxRadius: 2,
                                              backgroundColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          Text(
                                            OffersArrayName[index]["title3"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: h * 0.024,
                                            child: const CircleAvatar(
                                              maxRadius: 2,
                                              backgroundColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          Text(
                                            OffersArrayName[index]["title4"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: h * 0.024,
                                            child: const CircleAvatar(
                                              maxRadius: 2,
                                              backgroundColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          Text(
                                            OffersArrayName[index]["title5"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    ])
                              ],
                            ),
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.06, vertical: h * 0.03),
                        child: Container(
                          height: h * 0.0800,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 206, 201, 201)),
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  OffersArrayName[index]["title"],
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  OffersArrayName[index]["title"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
                  })
            ]),
      ),

      //   Padding(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: w * 0.03, vertical: h * 0.02),
      //     child: Stack(children: [
      //       Container(
      //         height: h * 0.32,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8),
      //             border:
      //                 Border.all(color: Color.fromARGB(255, 235, 224, 224)),
      //             color: const Color(0xffFFFFFF),
      //             boxShadow: const [
      //               BoxShadow(
      //                 color: Color.fromARGB(69, 143, 145, 135),
      //                 blurRadius: 4,
      //               ),
      //             ]),
      //             child: Column(mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [ ],),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(
      //             horizontal: w * 0.03, vertical: h * 0.02),
      //         child: Container(
      //           height: h * 0.0800,
      //           decoration: BoxDecoration(
      //               border: Border.all(
      //                   color: const Color.fromARGB(255, 206, 201, 201)),
      //               borderRadius: BorderRadius.circular(6)),
      //         ),
      //       )
      //     ]),
      //   ),
      // ]),
    );
  }
}
