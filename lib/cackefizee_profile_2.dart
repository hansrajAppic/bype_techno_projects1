// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:paytm_apps/cackefizee_profile%20.dart';

// ignore: camel_case_types
class CackeFizeProfile2_Screen extends StatefulWidget {
  const CackeFizeProfile2_Screen({super.key});

  @override
  State<CackeFizeProfile2_Screen> createState() =>
      _CackeFizeProfile_ScreenState();
}

// ignore: camel_case_types, duplicate_ignore
class _CackeFizeProfile_ScreenState extends State<CackeFizeProfile2_Screen> {
  String countryCode = '';
  TextEditingController EmailController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController AeraController = TextEditingController();
  TextEditingController AddersController = TextEditingController();
  bool chack = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
              EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.03),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.03,
              ),
              const Center(
                child: Text(
                  "Complete Your Profile",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              const Center(
                child: CircleAvatar(
                  maxRadius: 50,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
              ),
              TextFormField(
                controller: EmailController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter check password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TextFormField(
                controller: NameController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Name)",
                  prefixIcon: Icon(Icons.door_back_door),
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter check password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * 0.02,
              ),
              IntlPhoneField(
                onChanged: (phon) {
                  // ignore: avoid_print
                  print(phon.completeNumber);
                },
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(top: h * 0.03, right: w * 0.03),
                    child: const Text(
                      "VERIFIED",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelText: 'Phone Number',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: h * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 22,
                ),
                child: SizedBox(
                    height: 52,
                    width: 335,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CackeFizeProfile_Screen()),
                        );
                      },
                      child: const Text(
                        "COMPLETET",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
