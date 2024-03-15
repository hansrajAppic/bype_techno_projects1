import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:paytm_apps/cacke_fize_on_bottamshet.dart';
import 'package:paytm_apps/cackfize_myoder_screen.dart';
import 'package:paytm_apps/flowers_screen.dart';
import 'package:paytm_apps/list_map.dart';

class CackeFizeScreen extends StatefulWidget {
  const CackeFizeScreen({super.key});

  @override
  State<CackeFizeScreen> createState() => _CackeFizeScreenState();
}

class _CackeFizeScreenState extends State<CackeFizeScreen> {
  // int selectIndex = 0;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Row(
        children: [
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.orange,
                          Colors.red,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(39),
                      )),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Corporate Id",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text(
                                  "573303418",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  "User ID",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text(
                                  "USER 1",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("My Profile"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Change your Login ID"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.arrow_back_ios_new_sharp),
                  title: const Text("Change your Login ID"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.star_border),
                  title: const Text("Rat Us "),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.shop),
                  title: const Text("FAQs"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text("Isafe"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_callback_rounded),
                  title: const Text("Contact Us"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.bookmark_outline_outlined),
                  title: const Text("Feedback"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 211, 189, 189),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Cacke-removebg-preview.png",
          height: 25,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CackeFizeMyOder()),
                );
              },
              icon: const Icon(Icons.notifications_active)),
          SizedBox(
            width: w * 0.03,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CackeFizeMyOder()),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
              )),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.010),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.11,
                  child: ListView.builder(
                      itemCount: CackeFizArrayName.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.01, vertical: h * 0.0),
                                child: CircleAvatar(
                                  maxRadius: 29,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FlowersScreen()),
                                        );
                                      },
                                      child: (Image.asset(
                                        CackeFizArrayName[index]["image"],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                CackeFizArrayName[index]["title"],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          print(currentIndex);
                        },
                        child:
                        
                          CarouselSlider(  
                             items: CurserSliderArrayName.map((item) => ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.01),
                                  child: Image.asset(
                                    item["image"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              )).toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              aspectRatio: 2,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              // enlargeCenterPage: true,
                              viewportFraction: 1,
                              onPageChanged: ((index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              })),
                        )),

                        
                  ],
                ),
                SizedBox(
                  height: h * 0.013,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: CurserSliderArrayName.asMap().entries.map((entry) {
                    print(entry);

                    print(entry.key);
                    return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.red
                                  : Colors.teal),
                        ));
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.015, vertical: h * 0.02),
                  child: Row(children: <Widget>[
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 130, 119, 119),
                    )),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Text(
                      "TRENADING CAKES",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 130, 119, 119),
                    )),
                  ]),
                ),
                SizedBox(
                  height: h * 0.33,
                  child: ListView.builder(
                      itemCount: TradingArrayName.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Stack(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Descraption()));
                            },
                            child: (Container(
                              height: h * 0.3,
                              width: w * 0.49,
                              margin:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromARGB(255, 236, 237, 238),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffDDDDDD),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(0.10, 0.0),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: h * 0.20,
                                    ),
                                    Text(TradingArrayName[index]["title"]),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          TradingArrayName[index]["title1"],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: w * 0.03,
                                        ),
                                        const Text(
                                          "₹ 799",
                                          style: TextStyle(
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: w * 0.05,
                                        ),
                                        Text(
                                          TradingArrayName[index]["title2"],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: h * 0.0280,
                                          child: const Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ),
                          Container(
                            height: h * 0.2,
                            width: w * 0.49,
                            margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 224, 222, 222))),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Descraption()));
                                },
                                child: Image.asset(
                                  TradingArrayName[index]["image"],
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ]);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.015, vertical: h * 0.0),
                  child: Row(children: <Widget>[
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 130, 119, 119),
                    )),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    const Text(
                      "POPULAR COMBOS",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 130, 119, 119),
                    )),
                  ]),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                SizedBox(
                  height: h * 0.35,
                  child: ListView.builder(
                      itemCount: PopularComboseArrayName.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              child: Container(
                                height: h * 0.46,
                                width: w * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    // color: Color.fromARGB(255, 253, 253, 253),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 226, 217, 217)),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(69, 143, 145, 135),
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
                                                PopularComboseArrayName[index]
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
                                                PopularComboseArrayName[index]
                                                    ["title2"],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                PopularComboseArrayName[index]
                                                    ["title3"],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.green),
                                              ),
                                              SizedBox(
                                                width: w * 0.03,
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
                                                PopularComboseArrayName[index]
                                                    ["title4"],
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 3,
                                                itemSize: 12,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
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
                                                PopularComboseArrayName[index]
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
                            ),
                            Positioned(
                              //<-- SEE HERE
                              right: 0,
                              top: 1,
                              left: w * 0.001,
                              child: Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: w * 0.02),
                                height: h * 0.25,
                                width: w * 0.5,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(69, 143, 145, 135),
                                        blurRadius: 7,
                                      ),
                                    ]),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    FlowersBuquteArrayName[index]["image"],
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.015, vertical: h * 0.00),
                  child: Row(children: <Widget>[
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 130, 119, 119),
                    )),
                    SizedBox(
                      width: w * 0.03,
                      height: h * 0.0640,
                    ),
                    const Text(
                      "BEST SELLING FLOWERS",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 130, 119, 119),
                    )),
                  ]),
                ),
                SizedBox(
                  height: h * 0.38,
                  child: ListView.builder(
                      itemCount: BestSellimgFlowersArrayName.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            (Container(
                              height: h * 0.34,
                              width: w * 0.49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: const Color.fromARGB(255, 237, 237, 237),
                                color: Colors.deepOrangeAccent,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(69, 199, 201, 193),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: h * 0.24, left: w * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      BestSellimgFlowersArrayName[index]
                                          ["title"],
                                    ),
                                    Text(
                                      BestSellimgFlowersArrayName[index]
                                          ["title1"],
                                    ),
                                    Text(
                                      BestSellimgFlowersArrayName[index]
                                          ["title2"],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Container(
                              width: w * 0.49,
                              height: h * 0.24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red),
                              child: Image.asset(
                                BestSellimgFlowersArrayName[index]["image"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ]),
                        );
                      }),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: h * 0.2,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: w * 0.024),
                          height: 100,
                          width: 1444,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 239, 216, 216),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/images/rsz_logo.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    itemCount: SpaselFlavereArrayName.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3.1),
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                            height: h * 0.46,
                            width: w * 0.63,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 253, 253, 253),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(SpaselFlavereArrayName[index]
                                          ["title"]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            SpaselFlavereArrayName[index]
                                                ["title1"],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            SpaselFlavereArrayName[index]
                                                ["title2"],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            SpaselFlavereArrayName[index]
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
                                            SpaselFlavereArrayName[index]
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
                                            SpaselFlavereArrayName[index]
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
                            margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                            height: h * 0.25,
                            width: w * 0.63,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
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
                                SpaselFlavereArrayName[index]["image"],
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: 40,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    itemCount: BallonArrayName.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3.1),
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                            height: h * 0.46,
                            width: w * 0.63,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 253, 253, 253),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(SpaselFlavereArrayName[index]
                                          ["title"]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            SpaselFlavereArrayName[index]
                                                ["title1"],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            BallonArrayName[index]["title2"],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            BallonArrayName[index]["title3"],
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
                                            BallonArrayName[index]["title4"],
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
                                            BallonArrayName[index]["title5"],
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
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                          height: h * 0.25,
                          width: w * 0.63,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
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
                              BallonArrayName[index]["image"],
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ]);
                    }),
              ]),
        ),
      ),
    );
  }
}
