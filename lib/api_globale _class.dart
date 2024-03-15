// import 'dart:io';

// import 'package:android_id/android_id.dart';

// class DivaiceComponent {
//   String _deviceId = "";
//   @override
//   static Future<String?> _getDeviceId() async {
//     String? deviceId;
//     if (Platform.isAndroid) {
//       var androidId = AndroidId();
//       deviceId = await androidId.getId();

//       return deviceId;
//     }
//   }
// }

import 'package:flutter/material.dart';

class Appy extends StatefulWidget {
  const Appy({super.key});

  @override
  State<Appy> createState() => _AppyState();
}

class _AppyState extends State<Appy> {
  var animalList = ['dog', 'cat', 'cow'];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
