import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:paytm_apps/list_map.dart';

class FlowersScreen extends StatefulWidget {
  const FlowersScreen({super.key});

  @override
  State<FlowersScreen> createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {
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
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.024, vertical: h * 0.02),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      controller: ScrollController(),
                      itemCount: FlowersBuquteArrayName.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3.3),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              height: h * 0.49,
                              width: w * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(69, 143, 145, 135),
                                      blurRadius: 7,
                                    ),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: h * 0.26,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.02),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(FlowersBuquteArrayName[index]
                                            ["title"]),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FlowersBuquteArrayName[index]
                                                  ["title1"],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: w * 0.02,
                                            // ),
                                            Text(
                                              FlowersBuquteArrayName[index]
                                                  ["title2"],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              FlowersBuquteArrayName[index]
                                                  ["title3"],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green),
                                            ),
                                            SizedBox(
                                              width: w * 0.002,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              FlowersBuquteArrayName[index]
                                                  ["title4"],
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3,
                                              itemSize: 12,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 4,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 001.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            Text(
                                              FlowersBuquteArrayName[index]
                                                  ["title5"],
                                              style: const TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: h * 0.25,
                              width: w * 0.5,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  color: Colors.red,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(69, 143, 145, 135),
                                      blurRadius: 7,
                                    ),
                                  ]),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                child: Image.asset(
                                  FlowersBuquteArrayName[index]["image"],
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ); //just for testing, will fill with image later
                      }),
                ]),
          ),
        ));
  }
}
