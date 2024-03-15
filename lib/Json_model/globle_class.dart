
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyGlobalFunctions {
  String? deviceID = '';
  static Future<String?> getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    try {
      if (!kIsWeb) {
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          deviceId = androidInfo.androidId;
        } else if (Platform.isIOS) {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          deviceId = iosInfo.identifierForVendor;
        }
      } else {}
    } catch (e) {
      print('');
    }
    return deviceId;
  }

  static showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Text("ap"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 10),
              Text('Please wait...'),
            ],
          ),
        );
      },
    );
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }

  static String? dataApi = "";
  // ignore: non_constant_identifier_names
  static Future<String?> PostCall(String Data, String? deviceID) async {
    var headers = {
      'DeviceID': '$deviceID',
      'Cookie':
      'ASP.NET_SessionId=gg5uofsoxsrba1uv0egdcwrg; ASP.NET_SessionId=b4qkrzbfle40tws0hkysbufq'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://sonitechno.info/api/mobileapi.aspx"));

    request.fields.addAll({'Request': Data});

    request.headers.addAll(headers);

    http.Response response =
    await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      //   print(">>>>>>>>>>>>>>api call${response.body}");
      return response.body;
    } else {
      return "";
    }
  }
}