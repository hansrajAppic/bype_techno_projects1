import 'package:flutter/material.dart';
import 'package:paytm_apps/cackefizee_profile_2.dart';
import 'package:paytm_apps/list_map.dart';

// ignore: camel_case_types
class ChackoutCackfiz_scrreen extends StatefulWidget {
  const ChackoutCackfiz_scrreen({super.key});

  @override
  State<ChackoutCackfiz_scrreen> createState() =>
      _CackeFizeProfile_ScreenState();
}

// ignore: camel_case_types, duplicate_ignore
class _CackeFizeProfile_ScreenState extends State<ChackoutCackfiz_scrreen> {
  bool chack = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 227),
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
      body: SingleChildScrollView(
          child: (Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: const Color(0xffFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(69, 143, 145, 135),
                      blurRadius: 4,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: w * 0.1, child: Icon(Icons.delivery_dining)),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Delivery to: 302020",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            SizedBox(
              height: h * 0.73,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ChackoutDelevryArrayName.length,
                  itemBuilder: (BuildContext context, index) {
                    return Stack(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.03, vertical: h * 0.007),
                        child: Container(
                          height: h * 0.194,
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
                            padding:
                                EdgeInsets.only(left: w * 0.42, top: h * 0.008),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ChackoutDelevryArrayName[index]["title"],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ChackoutDelevryArrayName[index]["title1"],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ChackoutDelevryArrayName[index]["title2"],
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.41, top: h * 0.037),
                                  child: IconButton(
                                      onPressed: () {
                                        // setState(() {
                                        //   ChackoutDelevryArrayName.removeAt(
                                        //       index);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Text('delete Itam'),
                                            action: SnackBarAction(
                                              textColor: Colors.black,
                                              label: 'Delete',
                                              onPressed: () {
                                                setState(() {
                                                  ChackoutDelevryArrayName
                                                      .removeAt(index);
                                                });
                                                // setState(() {
                                                //   ChackoutDelevryArrayName.removeAt(
                                                //
                                                // Code to execute.
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      icon: (const Icon(Icons.delete))),
                                )
                              ],
                            ),
                          ),
                          //     child: Padding(
                          //       padding:
                          //           EdgeInsets.only(left: w * 0.42, top: h * 0.008),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             "Delicious Black Forest",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w600,
                          //             ),
                          //           ),
                          //           Text(
                          //             "₹ 549",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w600,
                          //             ),
                          //           ),
                          //           Text(
                          //             "Weight 1/2 KG",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             height: h * 0.0580,
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(left: w * 0.44),
                          //             child: Icon(Icons.delete),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            height: h * 0.194,
                            width: w * 0.38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(69, 143, 145, 135),
                                    blurRadius: 4,
                                  ),
                                ]),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              child: Image.asset(
                                ChackoutDelevryArrayName[index]["image"],
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ]);
                  }),
            ),

            Stack(children: [
              Container(
                height: h * 0.070,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: const Color(0xffFFFFFF),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 143, 145, 135),
                        blurRadius: 4,
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.02, left: w * 0.1),
                  child: const Text(
                    "₹ 2745",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CackeFizeProfile2_Screen()));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.47,
                  ),
                  child: Container(
                    height: h * 0.070,
                    width: w * 0.53,
                    color: Colors.orange,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "CHECKOUT",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          const Icon(Icons.safety_check, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            //   SizedBox(
            //     height: h * 0.4,
            //   ),
            // ])
            // Stack(children: [
            //   Container(
            //     height: h * 0.22,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         color: const Color(0xffFFFFFF),
            //         boxShadow: const [
            //           BoxShadow(
            //             color: Color.fromARGB(69, 143, 145, 135),
            //             blurRadius: 4,
            //           ),
            //         ]),
            //     child: Padding(
            //       padding: EdgeInsets.only(left: w * 0.42, top: h * 0.008),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Delicious Black Forest",
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //           Text(
            //             "₹ 549",
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //           Text(
            //             "Weight 1/2 KG",
            //             style: TextStyle(
            //               fontSize: 14,
            //             ),
            //           ),
            //           SizedBox(
            //             height: h * 0.0940,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.only(left: w * 0.49),
            //             child: Icon(Icons.delete),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            //   Container(
            //       height: h * 0.22,
            //       width: w * 0.38,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8),
            //           color: Colors.red,
            //           boxShadow: const [
            //             BoxShadow(
            //               color: Color.fromARGB(69, 143, 145, 135),
            //               blurRadius: 4,
            //             ),
            //           ]),
            //       child: Image.asset(
            //         "assets/images/rsz_backery.png",
            //         fit: BoxFit.cover,
            //       )),
            // ]),
          ]))),
    );
  }
}
