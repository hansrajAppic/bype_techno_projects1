import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paytm_apps/logain_page.dart';
import 'package:paytm_apps/paytem_them.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SpleshPaytemScreen extends StatefulWidget {
  const SpleshPaytemScreen({super.key});

  @override
  State<SpleshPaytemScreen> createState() => SpleshScrrenState();
}

class SpleshScrrenState extends State<SpleshPaytemScreen> {
  static const String KEYLOGIN = "Login";
  static const String Mobaile = "UserSaveData";
  static const String Password = "UserPassword";

  @override
  void initState() {
    super.initState();
    sedpreprancedata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 125, 144),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 280, left: 120),
              child: Image.asset(
                "assets/images/paytm-logo.png",
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 230,
            ),
          ]),
    );
  }

  Future<void> sedpreprancedata() async {
    
    SharedPreferences sp = await SharedPreferences.getInstance();
    var isLoggedIn = sp.getBool(KEYLOGIN);

    print({isLoggedIn});
    Timer(Duration(seconds: 1), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaytmTheme()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyLogin()));
        }
      } else {
        Navigator.push(
         context, MaterialPageRoute(builder: (context) => const MyLogin()));
      }
    });
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:paytm_apps/dashborddeepk.dart';
// import 'package:paytm_apps/logain_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SpleshPaytemScreen extends StatefulWidget {
//   const SpleshPaytemScreen({super.key});

//   @override
//   State<SpleshPaytemScreen> createState() => SpleshScrrenState();
// }

// class SpleshScrrenState extends State<SpleshPaytemScreen> {
//   static const String KEYLOGIN = "Login";
//   static const String KEYUSER = "UserSaveData";
//   @override
//   void initState() {
//     super.initState();
//     sedpreprancedata();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 87, 125, 144),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 280, left: 120),
//               child: Image.asset(
//                 "assets/images/paytm-logo.png",
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: 230,
//             ),
//           ]),
//     );
//   }

//   Future<void> sedpreprancedata() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     var isLoggedIn = sp.getBool(KEYLOGIN);
//     print({isLoggedIn});
//     Timer(Duration(seconds: 2), () {
//       if (isLoggedIn != null) {
//         if (isLoggedIn) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const MyLogin()));
//         } else {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => MyLogin()));
//         }
//       } else {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const MyLogin()));
//       }
//     });
//   }
// }
