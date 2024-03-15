// ignore_for_file: avoid_print, prefer_const_constructors, prefer_final_fields, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers, unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paytm_apps/Json_model/banermodal.dart';
import 'package:paytm_apps/Json_model/globle_class.dart';
import 'package:paytm_apps/Messages.dart';
import 'package:paytm_apps/demt_scrreen.dart';
import 'package:paytm_apps/list_map.dart';
import 'package:paytm_apps/logain_page.dart';
import 'package:paytm_apps/rechargr2_operate.dart';
import 'package:paytm_apps/serch_screen.dart';
import 'package:paytm_apps/splesh_paytm_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaytmTheme extends StatefulWidget {
  const PaytmTheme({super.key});

  @override
  State<PaytmTheme> createState() => _PaytmThemeState();
}

class _PaytmThemeState extends State<PaytmTheme> {
  ScrollController ctrl1 = ScrollController();
  ScrollController ctrl2 = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  bool isCtrl1Scroll = true;
  File? _profileImage;

  // ignore: prefer_typing_uninitialized_variables
  var sp;
  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  //  Future<String?> deviceIDs = MyGlobalFunctions.getId();
  List<BannerListData> banners = [];

  @override
  void initState() {
    ctrl1.addListener(_ctrl1Listner);
    ctrl2.addListener(_ctrl2Listner);
    loadData();

    super.initState();
    apiCall().then((value) {});
  }

  void startAutoScroll() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScrollPosition = _scrollController.position.pixels;
        if (currentScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            currentScrollPosition + 100.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  double? _imageWidth;
  double? _imageHeight;
  @override
  void dispose() {
    ctrl1.removeListener(_ctrl1Listner);
    ctrl2.removeListener(_ctrl2Listner);
    ctrl1.dispose();
    ctrl2.dispose();
    super.dispose();
    _scrollController.dispose();
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

  loadData() async {
    var sharedPrefe = await SharedPreferences.getInstance();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff022A72),

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchScreen()));
                          },
                          child: SizedBox(
                            width: 130,
                            height: 130,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : null,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: _pickProfileImage,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade400,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt_sharp,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const Padding(
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 50.0,
                                vertical: 10.0,
                              ),
                              title: Text(
                                "are you sure? you want to Close Applications",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            Future.delayed(Duration(seconds: 1),
                                                () {
                                              Navigator.of(context).pop(true);
                                            });
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 120.0,
                                                vertical: 146.0,
                                              ),
                                              title: Text(
                                                "No Thanks",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            );
                                          });
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.08,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      SharedPreferences sp =
                                          await SharedPreferences.getInstance();

                                      sp.clear();

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyLogin()));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Color(0xffFFCDD2),
                                            content: Text(
                                              "Yes Logout",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      );
                                    },
                                    child: Text(
                                      "yes",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                ],
                              ));
                        });
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
//       appBar: App
      appBar: AppBar(
        backgroundColor: Color(0xff022A72),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_2,
                    color: Color.fromARGB(255, 158, 183, 204),
                  )),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   "assets/images/paytm.png",
                //   height: 50,
                // ),
                Text(
                  "Paytm",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  width: w * 0.02,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Image.asset(
                  "assets/images/upi-removebg-preview.png",
                  height: 30,
                ),
              ]),
        ),
        centerTitle: false,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MassagesScreen()));
              },
              child: const Icon(
                Icons.messenger_outline,
                color: Colors.white,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
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
                  const SizedBox(height: 180),
                  Container(
                    height: MediaQuery.of(context).size.longestSide - 100,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 242, 247, 251),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SingleChildScrollView(
                          physics: isCtrl1Scroll
                              ? const NeverScrollableScrollPhysics()
                              : const ClampingScrollPhysics(),
                          controller: ctrl2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18),
                              //                             CarouselSlider.builder(
                              //                               options: CarouselOptions(
                              //                                 viewportFraction: 0.8, // Experiment with different values
                              // autoPlayInterval: const Duration(seconds: 3),
                              // scrollPhysics: const BouncingScrollPhysics(),
                              // aspectRatio: 1,
                              // autoPlay: true,
                              // autoPlayCurve: Curves.fastOutSlowIn,
                              //                               ),
                              //                               itemCount: banners.length ?? 0,
                              //                               itemBuilder: (context, index, realIndex) {
                              //                                 var makeFullUrl =
                              //                                     "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

                              //                                 return Column(
                              //                                   children: [
                              //                                     Text(banners[index].name ?? ""),
                              //                                     SizedBox(
                              //                                       child: SizedBox(
                              //                                           child: Image.network(makeFullUrl)),
                              //                                     ),
                              //                                   ],
                              //                                 );
                              //                               },
                              //                             ),

                              // CarouselSlider.builder(
                              //   options: CarouselOptions(
                              //     viewportFraction: 1,
                              //     autoPlayInterval: const Duration(seconds: 3),
                              //     scrollPhysics: const BouncingScrollPhysics(),
                              //     aspectRatio: 1,
                              //     autoPlay: true,
                              //     autoPlayCurve: Curves.fastOutSlowIn,
                              //   ),
                              //   itemCount: banners.length,
                              //   itemBuilder: (context, index, realIndex) {
                              //     var makeFullUrl =
                              //         "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

                              //     return Column(
                              //       children: [
                              //         Text(banners[index].name ?? ""),
                              //         SizedBox(
                              //           child: Image.network(makeFullUrl),
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // ),



                               CarouselSlider.builder(
                                options: CarouselOptions(
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },

                                  viewportFraction: 1.0,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlay: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                ),
                                itemCount: banners.length ?? 0,
                                itemBuilder: (context, index, realIndex) {
                                  // setState(() {

                                  var makeFullUrl =
                                      "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

                                  return SizedBox(
                                    child: SizedBox(
                                        child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: w * 0.01),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: const Color(0xffFFFFFF),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  137, 134, 128, 128)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  69, 143, 145, 135),
                                              blurRadius: 4,
                                            ),
                                          ]),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Image.network(
                                              width: double.infinity,
                                              height: 180,
                                              makeFullUrl)),
                                    )),
                                  );
                                },
                              ),

                              DotsIndicator(
                                dotsCount: banners.length,
                                position: currentIndex,
                                decorator: DotsDecorator(
                                  color: Colors.grey, // Inactive dot color
                                  activeColor: Colors.blue, // Active dot color
                                  size: Size.square(8.0), // Dot size
                                  activeSize:
                                      Size(20.0, 8.0), // Active dot size
                                  spacing: EdgeInsets.all(
                                      4.0), // Spacing between dots
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Change the active dot shape
                                  ),
                                ),
                              ),

                              // DotsIndicator(
                              //   dotsCount: banners.length,
                              //   position: currentIndex.bitLength,
                              //   decorator: DotsDecorator(
                              //     color: Colors.grey, // Inactive dot color
                              //     activeColor: Colors.blue, // Active dot color
                              //     size: Size.square(8.0), // Dot size
                              //     activeSize:
                              //         Size(20.0, 8.0), // Active dot size
                              //     spacing: EdgeInsets.all(
                              //         4.0), // Spacing between dots
                              //     activeShape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(5.0),
                              //     ), // Active dot shape
                              //   ),
                              // ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                height: h * 0.16,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffFFFFFF),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(69, 143, 145, 135),
                                        blurRadius: 4,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: h * 0.015,
                                      ),
                                      Text(
                                        "ll RECHARGE SERIVICE ll",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: h * 0.014,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 248, 245, 245),
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      transitionsBuilder:
                                                          (context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child) {
                                                        return ScaleTransition(
                                                          alignment:
                                                              Alignment.center,
                                                          scale: Tween<double>(
                                                                  begin: 0.1,
                                                                  end: 1)
                                                              .animate(
                                                            CurvedAnimation(
                                                              parent: animation,
                                                              curve: Curves
                                                                  .bounceIn,
                                                            ),
                                                          ),
                                                          child: child,
                                                        );
                                                      },
                                                      transitionDuration:
                                                          Duration(seconds: 2),
                                                      pageBuilder: (BuildContext
                                                              context,
                                                          Animation<double>
                                                              animation,
                                                          Animation<double>
                                                              secondaryAnimation) {
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
                                            backgroundColor: Color.fromARGB(
                                                255, 248, 245, 245),
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
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              SizedBox(
                                  height: h * 0.094,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 50,
                                      itemBuilder: (context, index) {
                                        return (Container(
                                          margin:
                                              EdgeInsets.only(left: w * 0.013),
                                          height: 0.05,
                                          width: w * .9,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 230, 215, 215)),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ListTile(
                                            dense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: w * 0.012,
                                                right: w * 0.023),
                                            leading: CircleAvatar(
                                              maxRadius: 17,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 248, 246, 246),
                                              child: Image.asset(
                                                "assets/images/airtel2.png",
                                                height: 25,
                                              ),
                                            ),
                                            title: const Text(
                                              "Prepaid-8890977983",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: const Text(
                                              "₹ 155 plan expride 2 day (s) ago",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            trailing: SizedBox(
                                              height: h * 0.042,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          side: const BorderSide(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      218,
                                                                      199,
                                                                      199))),
                                                  child: const Text(
                                                    "Recharge",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255,
                                                            139,
                                                            183,
                                                            219)),
                                                  )),
                                            ),
                                          ),
                                        ));
                                      })),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Container(
                                height: h * 0.3,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xffD5EAFF),
                                      Color.fromARGB(255, 179, 212, 245),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h * 0.02,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.02),
                                      child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "BANKING & PAYMENTS",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Spacer(),
                                            Text(
                                              "POWERED BY ",
                                              style: TextStyle(
                                                fontSize: 9,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: h * 0.02,
                                    ),
                                    SizedBox(
                                      height: h * 0.13,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: iconData.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: w * 0.055),
                                                  height: h * 0.055,
                                                  width: w * 0.12,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 75, 66, 66),
                                                      borderRadius:
                                                          BorderRadiusDirectional
                                                              .circular(16)),
                                                  child: Center(
                                                    child: Icon(
                                                      iconData[index]['icon'],
                                                      color: Colors.white,
                                                      size: 22,
                                                    ),
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    iconData[index]['text'],
                                                    style: const TextStyle(
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.1,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: iconDataArryName.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: w * 0.068),
                                                  child: Icon(
                                                    iconDataArryName[index]
                                                        ['icon'],
                                                    color: Colors.white,
                                                    size: 26,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    iconDataArryName[index]
                                                        ['text'],
                                                    style: const TextStyle(
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Container(
                                  height: h * 0.2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: const Color(0xFFFFFFFF),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 232, 213, 213)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(69, 143, 145, 135),
                                          blurRadius: 4,
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.03,
                                            vertical: h * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: h * 0.03,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromARGB(255, 236,
                                                            228, 228)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: Colors.amber),
                                                child: const Center(
                                                  child: Text(
                                                    "UPI Lite",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                            Container(
                                                height: h * 0.03,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromARGB(255, 236,
                                                            228, 228)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: Colors.amber),
                                                child: const Center(
                                                  child: Text(
                                                    "₹ 3 Lakh",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.008,
                                            vertical: h * 0.00),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/scan-removebg-preview.png",
                                                  height: 25,
                                                ),
                                                SizedBox(
                                                  height: h * 0.02,
                                                ),
                                                SizedBox(
                                                  width: w * 0.05,
                                                ),
                                                const Text(
                                                  "  Blance & \n  History",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                    Icons.phone_iphone_sharp),
                                                SizedBox(
                                                  height: h * 0.02,
                                                ),
                                                const Text(
                                                  " Paytm Bank",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/bhank-removebg-preview.png",
                                                  height: 25,
                                                ),
                                                SizedBox(
                                                  height: h * 0.02,
                                                ),
                                                const Text(
                                                  "Paytm Wallet",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                const Text(
                                                  "Loan",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Text(
                                                  "offer",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 106, 169, 221)),
                                                ),
                                                SizedBox(
                                                  height: h * 0.003,
                                                ),
                                                const Text(
                                                  " Personal\n  Loan",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              SizedBox(
                                height: h * 0.073,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                              height: 10,
                                              width: w * 0.5,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 230, 215, 215)),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // Use This kElevationToShadow ***********
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 12),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const CircleAvatar(
                                                        maxRadius: 18,
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                199, 222, 240),
                                                        child:
                                                            Icon(Icons.wallet),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    h * 0.009),
                                                        child: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Refer & Win ",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                "Flat₹151",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ]),
                                              )));
                                    }),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Stack(children: [
                                Container(
                                  height: h * 0.39,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 228, 215, 215)),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(13.4)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Recharge & Bill Payments",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: h * 0.030,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: w * 0.16,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              207, 196, 196))),
                                                  child: const Text(
                                                    'My Bills',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 67, 65, 65)),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.03,
                                        ),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: w * 0.26),
                                            height: h * 0.022,
                                            width: w * 0.17,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 247, 198, 49)),
                                            child: const Center(
                                                child: Text(
                                              "Upto ₹300",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.002,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.008,
                                              vertical: h * 0.00),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.phone_iphone),
                                                  Text(
                                                    "Mobile\nRecharge",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/caridet-removebg-preview.png",
                                                    height: 26,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: w * 0.036),
                                                    child: const Text(
                                                      "Rent Via \nCredit card",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/dth-removebg-preview.png",
                                                    height: 28,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Text(
                                                      "Dth\nRecharge",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/bulb-removebg-preview.png",
                                                    height: 26,
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.003,
                                                  ),
                                                  const Text(
                                                    "Electricaty\n   Bill",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.008,
                                              vertical: h * 0.02),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Icon(
                                                        Icons.phone_iphone),
                                                  ),
                                                  Text(
                                                    "Caredit Card\n Payment",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Image.asset(
                                                      "assets/images/caridet-removebg-preview.png",
                                                      height: 26,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "Mobile\nPostpaid",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/gassCylinder-removebg-preview.png",
                                                    height: 28,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Text(
                                                      "Book GAs\nCylinder",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const CircleAvatar(
                                                    maxRadius: 15,
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      size: 21,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.003,
                                                  ),
                                                  const Text(
                                                    " View More",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: h * 0.0628,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 222, 225, 232),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(13),
                                                  bottomRight:
                                                      Radius.circular(13))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Center(
                                                  child: Text(
                                                    "Tap to explor the best recharge plans",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w * 0.01,
                                                ),
                                                const Icon(
                                                  Icons.phone_iphone_outlined,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: w * 0.14,
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Container(
                                          //     height: h * 0.066,
                                          //     width: double.infinity,
                                          //     color: const Color.fromARGB(
                                          //         255, 222, 225, 232),
                                          //     child: Padding(
                                          //       padding: const EdgeInsets.only(
                                          //           left: 20),
                                          //       child: Row(
                                          //         mainAxisAlignment:
                                          //             MainAxisAlignment.start,
                                          //         crossAxisAlignment:
                                          //             CrossAxisAlignment.center,
                                          //         children: [
                                          //           // const Center(
                                          //           //   child: Text(
                                          //           //     "Tap to explor the best recharge plans",
                                          //           //     style: TextStyle(
                                          //           //       fontSize: 12,
                                          //           //     ),
                                          //           //   ),
                                          //           // ),
                                          //           // SizedBox(
                                          //           //   width: w * 0.01,
                                          //           // ),
                                          //           // const Icon(
                                          //           //   Icons.phone_iphone_outlined,
                                          //           //   size: 12,
                                          //           // ),
                                          //           // SizedBox(
                                          //           //   width: w * 0.14,
                                          //           // ),
                                          //           // const Icon(
                                          //           //   Icons.arrow_forward_ios,
                                          //           //   size: 12,
                                          //           // ),
                                          //         ],
                                          //       ),
                                          //     ))
                                        )
                                      ]),
                                ),
                              ]),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Stack(children: [
                                Container(
                                  height: h * 0.39,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 228, 215, 215)),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(13.4)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: h * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Recharge & Bill Payments",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: h * 0.030,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: w * 0.16,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              207, 196, 196))),
                                                  child: const Text(
                                                    'My Bills',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 67, 65, 65)),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.03,
                                        ),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: w * 0.26),
                                            height: h * 0.022,
                                            width: w * 0.17,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 247, 198, 49)),
                                            child: const Center(
                                                child: Text(
                                              "Upto ₹300",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.002,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.008,
                                              vertical: h * 0.00),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.phone_iphone),
                                                  Text(
                                                    "Mobile\nRecharge",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/caridet-removebg-preview.png",
                                                    height: 26,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: w * 0.036),
                                                    child: const Text(
                                                      "Rent Via \nCredit card",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/dth-removebg-preview.png",
                                                    height: 28,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Text(
                                                      "Dth\nRecharge",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/bulb-removebg-preview.png",
                                                    height: 26,
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.003,
                                                  ),
                                                  const Text(
                                                    "Electricaty\n   Bill",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.008,
                                              vertical: h * 0.02),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Icon(
                                                        Icons.phone_iphone),
                                                  ),
                                                  Text(
                                                    "Caredit Card\n Payment",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Image.asset(
                                                      "assets/images/caridet-removebg-preview.png",
                                                      height: 26,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "Mobile\nPostpaid",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/gassCylinder-removebg-preview.png",
                                                    height: 28,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Text(
                                                      "Book GAs\nCylinder",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const CircleAvatar(
                                                    maxRadius: 15,
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      size: 21,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.003,
                                                  ),
                                                  const Text(
                                                    " View More",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: h * 0.0628,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 222, 225, 232),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(13),
                                                  bottomRight:
                                                      Radius.circular(13))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Center(
                                                  child: Text(
                                                    "Tap to explor the best recharge plans",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w * 0.01,
                                                ),
                                                const Icon(
                                                  Icons.phone_iphone_outlined,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: w * 0.14,
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Container(
                                          //     height: h * 0.066,
                                          //     width: double.infinity,
                                          //     color: const Color.fromARGB(
                                          //         255, 222, 225, 232),
                                          //     child: Padding(
                                          //       padding: const EdgeInsets.only(
                                          //           left: 20),
                                          //       child: Row(
                                          //         mainAxisAlignment:
                                          //             MainAxisAlignment.start,
                                          //         crossAxisAlignment:
                                          //             CrossAxisAlignment.center,
                                          //         children: [
                                          //           // const Center(
                                          //           //   child: Text(
                                          //           //     "Tap to explor the best recharge plans",
                                          //           //     style: TextStyle(
                                          //           //       fontSize: 12,
                                          //           //     ),
                                          //           //   ),
                                          //           // ),
                                          //           // SizedBox(
                                          //           //   width: w * 0.01,
                                          //           // ),
                                          //           // const Icon(
                                          //           //   Icons.phone_iphone_outlined,
                                          //           //   size: 12,
                                          //           // ),
                                          //           // SizedBox(
                                          //           //   width: w * 0.14,
                                          //           // ),
                                          //           // const Icon(
                                          //           //   Icons.arrow_forward_ios,
                                          //           //   size: 12,
                                          //           // ),
                                          //         ],
                                          //       ),
                                          //     ))
                                        )
                                      ]),
                                ),
                              ]),
                              SizedBox(
                                height: h * 0.038,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.75, left: w * 0.23, bottom: 5),
                          child: SizedBox(
                            height: h * 0.09,
                            width: w * 0.49,
                            child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DemtScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 12, 80, 152)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          "assets/images/scan-removebg-preview.png",
                                          color: Colors.white,
                                          height: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      const Center(
                                        child: Text(
                                          "Scan Any Qr",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
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
          ],
        ),
      ),
    );
  }

  // ignore: body_might_complete_normally_nullable
  // Future<BannerHome?> apiCall() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);

  //   if (userDataPref != null) {
  //     Map<String, dynamic> userJsonData =
  //         jsonDecode(userDataPref) as Map<String, dynamic>;
  //     print("*************** My User Save data ***********");
  //     print(userJsonData);
  //     var mobile = userJsonData["data"][0]["MOBILENUMBER"];
  //     print("mobile : $mobile");
  //     String? deviceID = "";
  //     try {
  //       String? result = await MyGlobalFunctions.getId();
  //       print(">>>>>>>>>>>>>>>>>>>>>> api dat${MyGlobalFunctions.getId()}");
  //       deviceID = result;
  //     } catch (error) {
  //       print('Error: $error');
  //     }
  //     String? getbanner = await MyGlobalFunctions.PostCall(
  //         '{"MethodName":"getbanner","UserID":"$mobile","Password":"$mobile", "AppType": " Apps"  }',
  //         "$deviceID");
  //     List<dynamic> jsonList = json.decode(getbanner!)['data'];
  //     List<BannerListData> getBanner =
  //         jsonList.map((json) => BannerListData.fromJson(json)).toList();
  //     banners = getBanner;
  //     setState(() {
  //       print(banners.length);
  //     });
  //   }
  // }

  // String? mobile;
  // String? password;

  // Future<BannerHome?> apiCall() async {
  //   try {
  //     SharedPreferences sp = await SharedPreferences.getInstance();
  //     String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
  //     String? userDatapassword = sp.getString(SpleshScrrenState.Password);
  //     if (userDataPref != null && userDatapassword != null) {
  //       String? deviceID = "";
  //       try {
  //         String? result = await MyGlobalFunctions.getId();
  //         print(">>>>>>>>>>>>>>>>>>>>>> api data $result");
  //         deviceID = result;
  //       } catch (error) {
  //         print('Error: $error');
  //       }
  //       print(">>>>>>>>>>>>>>>>>>>>>> api data $deviceID");

  //       String? verifyuserinotherphones = await MyGlobalFunctions.PostCall(
  //         '{"MethodName":"verifyuserinotherphone","UserID":"$userDataPref","Password": "$userDatapassword",}", "AppType": " Apps"  }',
  //         "$deviceID",
  //       );
  //       print("API Response: $verifyuserinotherphones");
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  Future<BannerHome?> apiCall() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
    String? userDatapassword = sp.getString(SpleshScrrenState.Password);
    if (userDataPref != null) {
      String? deviceID = "";

      try {
        String? result = await MyGlobalFunctions.getId();
        deviceID = result;
      } catch (error) {
        print('Error: $error');
      }

      String? getbanner = await MyGlobalFunctions.PostCall(
        '{"MethodName":"getbanner","UserID":"$userDataPref","Password":"$userDatapassword", "AppType": " Apps"  }',
        "$deviceID",
      );
      List<dynamic> jsonList = json.decode(getbanner!)['data'];
      List<BannerListData> getBanner =
          jsonList.map((json) => BannerListData.fromJson(json)).toList();
      banners = getBanner;
      setState(() {
        print(banners.length);
      });
    }
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
