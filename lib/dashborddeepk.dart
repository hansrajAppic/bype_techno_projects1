// // import 'dart:convert';
// // import 'dart:core';

// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:paytm_apps/Json_model/banermodal.dart';
// // import 'package:paytm_apps/Json_model/globle_class.dart';
// // import 'package:paytm_apps/splesh_paytm_screen.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class DashBordPage extends StatefulWidget {
// //   const DashBordPage({Key? key}) : super(key: key);
// //   @override
// //   State<DashBordPage> createState() => _DashBordPageState();
// // }

// // class _DashBordPageState extends State<DashBordPage> {
// //   List<BannerListData> banners = [];
// //   final items = ["Android", "iOS", "Desktop", "Web"];

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     apiCall().then((value) {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Dashbord")),
// //       body: ListView.builder(
// //           scrollDirection: Axis.horizontal,
// //           itemCount: banners.length ?? 0,
// //           itemBuilder: (context, index) {
// //             var makeFullUrl =
// //                 "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";
// //             return Container(
// //                 child: Column(
// //               children: [
// //                 Text(banners[index].name ?? ""),
// //                 SizedBox(
// //                   child: Image.network(makeFullUrl),
// //                 ),
// //                 SizedBox(
// //                   height: 20,
// //                 )
// //               ],
// //             ));
// //           }));
// //           }

// //   //     body:
// //   //       CarouselSlider.builder(
// //   //        options: CarouselOptions(
// //   //         viewportFraction: 1,
// //   //         autoPlayInterval: const Duration(seconds: 3),
// //   //         scrollPhysics: const BouncingScrollPhysics(),
// //   //         // height: 200.0,
// //   //         aspectRatio: 1,
// //   //         autoPlay: true,
// //   //         autoPlayCurve: Curves.fastOutSlowIn,
// //   //       ),
// //   //       itemCount: banners.length ?? 0,
// //   //       itemBuilder: (context, index, realIndex) {
// //   //         var makeFullUrl =
// //   //             "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

// //   //         return Column(
// //   //           children: [
// //   //             Text(banners[index].name ?? ""),
// //   //             SizedBox(
// //   //               child: SizedBox(child: Image.network(makeFullUrl)),
// //   //             ),
// //   //           ],
// //   //         );
// //   //       },
// //   //     ),
// //   //   );
// //   // }

// //   Future<BannerHome?> apiCall() async {
// //     // SharedPreferences sp = await SharedPreferences.getInstance();
// //     // String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);

// //     // if (userDataPref != null) {
// //     //   Map<String, dynamic> userJsonData =
// //     //       jsonDecode(userDataPref) as Map<String, dynamic>;
// //     //   print("*************** My User Save data ***********");
// //     //   print(userJsonData);
// //     //   var mobile = userJsonData["data"][0]["MOBILENUMBER"];
// //     //   print("mobile : $mobile");
// //     //   String? deviceID = "";
// //     //   try {
// //     //     String? result = await MyGlobalFunctions.getId();
// //     //     print(">>>>>>>>>>>>>>>>>>>>>> api dat${MyGlobalFunctions.getId()}");
// //     //     deviceID = result;
// //     //   } catch (error) {
// //     //     print('Error: $error');
// //     //   }

// //     SharedPreferences sp = await SharedPreferences.getInstance();
// //     String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
// //     String? userDatapassword = sp.getString(SpleshScrrenState.Password);
// //     if (userDataPref != null) {
// //       String? deviceID = "";

// //       try {
// //         String? result = await MyGlobalFunctions.getId();
// //         deviceID = result;
// //       } catch (error) {
// //         print('Error: $error');
// //       }

// //       String? getbanner = await MyGlobalFunctions.PostCall(
// //           '{"MethodName":"getbanner","UserID":"$userDataPref","Password":"$userDatapassword, "AppType": " Apps"  }',
// //           "$deviceID");
// //       List<dynamic> jsonList = json.decode(getbanner!)['data'];
// //       List<BannerListData> getBanner =
// //           jsonList.map((json) => BannerListData.fromJson(json)).toList();
// //       banners = getBanner;
// //       setState(() {
// //         print(banners.length);
// //       });
// //     }
// //   }

// // }

// import 'dart:convert';
// import 'dart:core';
// import 'dart:ffi';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutterdemo/splesh.dart';
// import 'package:paytm_apps/Json_model/banermodal.dart';
// import 'package:paytm_apps/Json_model/globle_class.dart';
// import 'package:paytm_apps/splesh_paytm_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // import 'globale.dart';
// // import 'model.dart';

// class DashBordPage extends StatefulWidget {
//   const DashBordPage({Key? key}) : super(key: key);
//   @override
//   State<DashBordPage> createState() => _DashBordPageState();
// }

// class _DashBordPageState extends State<DashBordPage> {
//   List<BannerListData> banners = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     apiCall().then((value) {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Dashbord")),

//   body:

//    CarouselSlider.builder(
//          options: CarouselOptions(
//           viewportFraction: 1,
//           autoPlayInterval: const Duration(seconds: 3),
//           scrollPhysics: const BouncingScrollPhysics(),
//           // height: 200.0,
//           aspectRatio: 1,
//           autoPlay: true,
//           autoPlayCurve: Curves.fastOutSlowIn,
//         ),
//         itemCount: banners.length ?? 0,
//         itemBuilder: (context, index, realIndex) {
//           var makeFullUrl =
//               "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

//           return Column(
//             children: [
//               Text(banners[index].name ?? ""),
//               SizedBox(
//                 child: SizedBox(child: Image.network(makeFullUrl)),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Future<BannerHome?> apiCall() async {

//   SharedPreferences sp = await SharedPreferences.getInstance();
//     String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
//     String? userDatapassword = sp.getString(SpleshScrrenState.Password);
//     if (userDataPref != null) {
//       String? deviceID = "";

//       try {
//         String? result = await MyGlobalFunctions.getId();
//         deviceID = result;
//       } catch (error) {
//         print('Error: $error');
//       }

//       String? getbanner = await MyGlobalFunctions.PostCall(
//           '{"MethodName":"getbanner","UserID":"$userDataPref","Password":"$userDatapassword", "AppType": " Apps"  }',
//          "$deviceID",
//       );
//       List<dynamic> jsonList = json.decode(getbanner!)['data'];
//       List<BannerListData> getBanner =
//           jsonList.map((json) => BannerListData.fromJson(json)).toList();
//       banners = getBanner;
//       setState(() {
//         print(banners.length);
//       });
//     }
//   }
// }

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paytm_apps/Json_model/banermodal.dart';
import 'package:paytm_apps/Json_model/globle_class.dart';
import 'package:paytm_apps/splesh_paytm_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBordPage extends StatefulWidget {
  const DashBordPage({Key? key}) : super(key: key);

  @override
  State<DashBordPage> createState() => _DashBordPageState();
}

class _DashBordPageState extends State<DashBordPage> {
  List<BannerListData> banners = [];

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        children: [
          banners.isEmpty
              ? Center(child: CircularProgressIndicator())
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 3),
                    scrollPhysics: const BouncingScrollPhysics(),
                    aspectRatio: 1,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  itemCount: banners.length,
                  itemBuilder: (context, index, realIndex) {
                    var makeFullUrl =
                        "https://sonitechno.info/images/Banner/${banners[index].imagePath ?? ""}";

                    return Column(
                      children: [
                        Text(banners[index].name ?? ""),
                        SizedBox(
                          child: Image.network(makeFullUrl),
                        ),
                      ],
                    );
                  },
                ),
          
        ],
      ),
    );
  }

  Future<void> apiCall() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? userDataPref = sp.getString(SpleshScrrenState.Mobaile);
      String? userDatapassword = sp.getString(SpleshScrrenState.Password);

      if (userDataPref != null) {
        String? deviceID = await MyGlobalFunctions.getId();

        String? getbanner = await MyGlobalFunctions.PostCall(
          '{"MethodName":"getbanner","UserID":"$userDataPref","Password":"$userDatapassword", "AppType": " Apps"  }',
          deviceID!,
        );

        List<dynamic> jsonList = json.decode(getbanner!)['data'];
        List<BannerListData> getBanner =
            jsonList.map((json) => BannerListData.fromJson(json)).toList();

        setState(() {
          banners = getBanner;
        });
      }
    } catch (error) {
      print('Error in API call: $error');
    }
  }
}
