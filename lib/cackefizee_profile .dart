// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: camel_case_types
class CackeFizeProfile_Screen extends StatefulWidget {
  const CackeFizeProfile_Screen({super.key});

  @override
  State<CackeFizeProfile_Screen> createState() =>
      _CackeFizeProfile_ScreenState();
}

class _CackeFizeProfile_ScreenState extends State<CackeFizeProfile_Screen> {
  // ignore: non_constant_identifier_names
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
              TextFormField(
                controller: EmailController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Mobile Number",
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
              TextFormField(
                controller: NameController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Aleernate Maobile Number Number (Opection)",
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
              TextFormField(
                controller: AddersController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Full Aderess",
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
              TextFormField(
                controller: AeraController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Area/LandMark",
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
                height: h * 0.04,
              ),
              const Text(
                "City",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              const Text(
                "State",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              const Text(
                "Pincode",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(color: Colors.black),
                    ),
                    checkColor: Colors.red,
                    activeColor: Colors.white,
                    focusNode: FocusNode(canRequestFocus: false),
                    value: chack,
                    onChanged: (bool? value) {
                      setState(() {
                        chack = value!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.024),
                    child: const Text(
                      "Its a Surprise Gift",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                      height: h * 0.0730,
                      width: w * 0.13,
                      child: const Icon(
                        Icons.help_outline_outlined,
                      )),
                ],
              ),
              TextFormField(
                controller: AddersController,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  prefixIcon: Icon(Icons.email_outlined),
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Select Delievry Date ",
                  hintStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter check password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: AeraController,
                decoration: InputDecoration(
                  isCollapsed: true,
                  prefixIcon: const Icon(Icons.percent),
                  suffixIcon: SizedBox(
                      width: w * 0.05,
                      child: const Icon(Icons.arrow_forward_ios)),
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Apply a Promo Code",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  border: const UnderlineInputBorder(),
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
              const Text(
                "Your Order",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * 0.028,
              ),
              const Text(
                "Delicous Black Forest",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              const Text(
                "Delicous Black Forest",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              const Text(
                "Delicous Black Forest",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                  height: h * 0.002,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 164, 202, 234),
                        Color.fromARGB(255, 183, 176, 176),
                      ],
                    ),
                  )),
              SizedBox(
                height: h * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
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
                            borderRadius: BorderRadius.circular(16)),
                        primary: Colors.green,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "PROCED TO PAYMENT",
                        style: TextStyle(
                            fontSize: 18,
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
