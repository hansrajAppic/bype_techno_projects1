// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:paytm_apps/checkout_cackfize.dart';

class Descraption extends StatefulWidget {
  const Descraption({super.key});

  @override
  State<Descraption> createState() => _DescraptionState();
}

TextEditingController MyController = TextEditingController();

class _DescraptionState extends State<Descraption> {
  ScrollController ctrl1 = ScrollController();
  ScrollController ctrl2 = ScrollController();
  bool isCtrl1Scroll = true;
  RangeValues values = const RangeValues(0, 1);

  TextEditingController Mycontroler = TextEditingController();
  int selectedContainerIndex = -1;
  Color selectedColor = Colors.orange;
  Color unselectedColor = const Color.fromARGB(255, 245, 237, 237);

  // List of container items
  List<String> containerItems = ['1/2 Kg', '1 KG', '1.5 KG', '2 KG'];
  bool isTapped = false;

  void handleTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  void initState() {
    ctrl1.addListener(_ctrl1Listner);
    ctrl2.addListener(_ctrl2Listner);
    super.initState();
  }

  @override
  void dispose() {
    ctrl1.removeListener(_ctrl1Listner);
    ctrl2.removeListener(_ctrl2Listner);
    ctrl1.dispose();
    ctrl2.dispose();
    super.dispose();
  }

  void _ctrl1Listner() {
    if (ctrl1.position.atEdge) {
      bool isTop = ctrl1.position.pixels == 0;
      if (isTop) {
        print('page_At the top');
      } else {
        setState(() {
          isCtrl1Scroll = false;
        });
        print('page_At the bottom');
      }
    }
  }

  void _ctrl2Listner() {
    if (ctrl2.position.atEdge) {
      bool isTop = ctrl2.position.pixels == 0;
      if (isTop) {
        setState(() {
          isCtrl1Scroll = true;
        });
        print('page_At the top::::::::::::ctrl2');
      } else {
        print('page_At the bottom:::::::::::ctrl2');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        centerTitle: true,
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: const Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: CircleAvatar(
      //       backgroundColor: Colors.red,
      //       child: Center(
      //         child: Text("PM"),
      //       ),
      //     ),
      //   ),
      //   title: const Text("PAYTM-UPI"),
      //   centerTitle: false,
      //   actions: const [
      //     Icon(Icons.search),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Icon(Icons.messenger_outline),
      //     SizedBox(
      //       width: 20,
      //     )
      //   ],
      // ),
      // appBar: AppBar(
      //   toolbarHeight: ,
      //   title: Image.asset("assets/images/rsz_cakes.png"),
      // ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              physics: isCtrl1Scroll
                  ? const ClampingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              controller: ctrl1,
              child: Column(
                children: [
                  const SizedBox(height: 115),
                  Container(
                    height: MediaQuery.of(context).size.longestSide - 100,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Delicious Black Forst",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "4.9",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          RatingBar.builder(
                                            initialRating: 3,
                                            itemSize: 20,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          const Text(
                                            "1313 Reviews",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        " SKU: CKBF01",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          " 549",
                                          style: TextStyle(
                                              fontSize: 38,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          " 27% OFF",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                      ])
                                ],
                              ),

                              SizedBox(
                                height: h * 0.02,
                              ),

                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    itemCount: containerItems.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, index) {
                                      return (InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedContainerIndex = index;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.01),
                                            child: Container(
                                                width: w * 0.21,
                                                // color: selectedContainerIndex ==
                                                //         index
                                                //     ? selectedColor
                                                //     : unselectedColor,
                                                // padding: EdgeInsets.all(16.0),
                                                decoration: BoxDecoration(
                                                    // color: Colors.white,
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromARGB(255, 197,
                                                            188, 188)),
                                                    color:
                                                        selectedContainerIndex ==
                                                                index
                                                            ? selectedColor
                                                            : unselectedColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                                child: Center(
                                                  child: Text(
                                                    containerItems[index],
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                )),
                                          )));
                                    }),
                              ),

                              SizedBox(
                                height: h * 0.03,
                              ),

                              Row(
                                children: <Widget>[
                                  Container(
                                    height: h * 0.070,
                                    width: w * 0.28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        color: const Color(0xffFFFFFF),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                69, 143, 145, 135),
                                            blurRadius: 4,
                                          ),
                                        ]),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.bluetooth_connected_sharp),
                                        Text(
                                          " Eggless",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextField(
                                        controller: MyController,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    8, 20, 0, 10),
                                            hintText: "Search For",
                                            hintStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 206, 197, 197)),
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 183, 169, 169))),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 126, 114, 114),
                                            ))),
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: h * 0.060,
                                      width: w * 0.7,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        color: const Color(0xffFFFFFF),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                69, 143, 145, 135),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: w * 0.04,
                                          ),
                                          const Icon(
                                            Icons.location_on_sharp,
                                          ),
                                          const Text(
                                            " Slect Dleivery Pincode",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: h * 0.060,
                                      width: w * 0.16,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          color: const Color(0xffFFFFFF),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  69, 143, 145, 135),
                                              blurRadius: 4,
                                            ),
                                          ]),
                                      child: InkWell(
                                          onTap: handleTap,
                                          child: Icon(
                                            Icons.favorite,
                                            color: isTapped
                                                ? Colors.red
                                                : Colors.black,
                                          )),
                                    )
                                  ]),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              const Text(
                                "Prouduct Details",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              const Text(
                                " Type - Cream",
                              ),

                              SizedBox(
                                height: h * 0.01,
                              ),
                              const Text(
                                " Shape - Round",
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              const Text(
                                " Flavor-  Blackforest",
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              const Text(
                                "We and our partners store and/or access information on a device, cookies and process will apply to this website only. You can change your preferences at any time by returning to this site or visit our privacy policy.",
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              const Text(
                                "Prouduct Description",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              const Text(
                                  "We and our partners store and/or   scanning. You may click to consent to our and our 719 partners’ processing as described above. Alternatively you may access more detailed information and change your preferences before consenting or to refuse consenting. Please note that some processing of your personal data may not require your consent, but you have a right to object to such processing. Your preferences will apply to this website only. You can change your preferences at any time by returning to this site or visit our privacy policy."),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              const Text(
                                "Rating and Revews",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "4.9",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        itemSize: 15,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      const Text(
                                        "1313 Reviews",
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text("5"),
                                          SizedBox(
                                            width: w * 0.04,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                height: h * 0.010,
                                                width: 192,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: const Color.fromARGB(
                                                        255, 196, 193, 193),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 2,
                                                      ),
                                                    ]),
                                              ),
                                              Container(
                                                height: h * 0.009,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: Colors.red,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 2,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("4"),
                                          SizedBox(
                                            width: w * 0.04,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                height: h * 0.010,
                                                width: 192,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: const Color.fromARGB(
                                                        255, 196, 193, 193),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 2,
                                                      ),
                                                    ]),
                                              ),
                                              Container(
                                                height: h * 0.009,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: Colors.red,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 2,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("3"),
                                          SizedBox(
                                            width: w * 0.04,
                                          ),
                                          Container(
                                            height: h * 0.009,
                                            width: 192,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                color: const Color.fromARGB(
                                                    255, 196, 193, 193),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        69, 143, 145, 135),
                                                    blurRadius: 2,
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text("3"),
                                          SizedBox(
                                            width: w * 0.04,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                height: h * 0.010,
                                                width: 192,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: const Color.fromARGB(
                                                        255, 196, 193, 193),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 2,
                                                      ),
                                                    ]),
                                              ),
                                              Container(
                                                height: h * 0.009,
                                                width: 180,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    color: Colors.red,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 2,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              // TextField(
                              const Text(
                                "Sonitecno  26/12/20",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 147, 135, 135)),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 15,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),

                              const Text(
                                " Similar Products",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),

                              GridView.builder(
                                  shrinkWrap: true,
                                  controller: ScrollController(),
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 4 / 5,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemCount: 4,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (Container(
                                          height: h * 0.3,
                                          width: w * 0.49,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color.fromARGB(
                                                255, 237, 237, 237),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    69, 143, 145, 135),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                      "assets/images/rsz_spacle.png")),
                                              SizedBox(
                                                height: h * 0.02,
                                              ),
                                              const Center(
                                                child: Text(
                                                  "BlackeForest Cakes",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )));
                                  }),
                              Container(
                                height: h * 0.2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(69, 143, 145, 135),
                                        blurRadius: 4,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.03, vertical: h * 0.02),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.car_crash,
                                              color: Color.fromARGB(
                                                  255, 153, 145, 145),
                                            ),
                                            Text(
                                              "Best Qulity",
                                            ),
                                            Icon(
                                              Icons.car_crash,
                                              color: Color.fromARGB(
                                                  255, 153, 145, 145),
                                            ),
                                            Text(
                                              "Best Qulity",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.04,
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.car_crash,
                                              color: Color.fromARGB(
                                                  255, 153, 145, 145),
                                            ),
                                            Text(
                                              "Best Qulity",
                                            ),
                                            Icon(
                                              Icons.car_crash,
                                              color: Color.fromARGB(
                                                  255, 153, 145, 145),
                                            ),
                                            Text(
                                              "Best Qulity",
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.22,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.64, bottom: 2),
                          child: SizedBox(
                            height: h * 0.07,
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChackoutCackfiz_scrreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          const Center(
                                            child: Text(
                                              "ADD TO CART",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const Center(
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Center(
                                        child: Text(
                                          "04 hrs 57 min sec left for todays delevry",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text("data"),
          ],
        ),
      ),
    );
  }
}
