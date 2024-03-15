import 'package:flutter/material.dart';

import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:paytm_apps/demt_confrempay.dart';
import 'package:paytm_apps/demt_scrreen.dart';

class DemtFundTransfer extends StatefulWidget {
  const DemtFundTransfer({super.key});

  @override
  State<DemtFundTransfer> createState() => _DemtFundTransferState();
}

class _DemtFundTransferState extends State<DemtFundTransfer> {
  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  String amountConvertEn = '';

  TextEditingController txtEmail = TextEditingController();
  void amountConvert() {
    txtEmail.text = txtEmail.text;
    int numberValue = int.parse(txtEmail.text);
    print(
        'numberValue>>>?????????${NumberToWordsEnglish.convert(numberValue)}');
    var amount = NumberToWordsEnglish.convert(numberValue);
    setState(() {
      amountConvertEn = amount;
    });

    print('123456789 >>>>>>>> ${amountConvertEn}');
  }

  final _formKey = GlobalKey<FormState>();
  int selectedContainerIndex = -1;
  Color selectedColor = Colors.orange;
  Color unselectedColor = Colors.white;
  List<String> containerItems = [
    'Rent',
    'Salary',
    'Others',
  ];
  bool checkd = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _key,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 255, 94, 0),
          toolbarHeight: 39,
          elevation: 0,
          // leading: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const DemtScreen()));
          //     },
          //     child: const Icon(
          //       Icons.arrow_back,
          //       size: 24,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DemtScreen()));
              },
              icon: Icon(
                Icons.arrow_back,
              )),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: w * 0.22,
                ),
                const Text(
                  "Fund Tarnsfer",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ]),
          centerTitle: true,
          leadingWidth: w * 0.08,
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          // reverse: true,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.02),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        height: h * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: const Color.fromARGB(255, 221, 224, 234),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 223, 217, 217)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(69, 143, 145, 135),
                                blurRadius: 4,
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.02, left: w * 0.05, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  maxRadius: 22,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 254, 254)
                                          .withOpacity(1.0),
                                  child: Image.asset(
                                    "assets/images/ifdc.png",
                                    height: 23,
                                  )),
                              SizedBox(
                                width: w * 0.03,
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "rrechrecharg",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    "XXXXXXX3507",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                            Color.fromARGB(255, 113, 112, 112)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          //<-- SEE HERE
                          left: w * 0.49,
                          child: Container(
                            height: h * 0.1,
                            width: w * w * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              // color: const Color.fromARGB(255, 199, 211, 228),
                              color: Colors.black26.withOpacity(0.1),
                              border: Border.all(
                                  color: Color.fromARGB(255, 202, 196, 196)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: w * 0.32,
                                ),
                                const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 240, 237, 237),
                                  maxRadius: 11,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ]),
                    SizedBox(
                      height: h * 0.006,
                    ),
                    const Text(
                      "Enter Amount",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     isCollapsed: true,
                    //     contentPadding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                    //     hintText: "₹",
                    //     hintStyle: const TextStyle(
                    //       fontSize: 17,
                    //     ),
                    //     border: OutlineInputBorder(

                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter check password';
                    //     }
                    //     return null;
                    //   },
                    // ),

                    Stack(children: [
                      Container(
                        height: h * 0.059,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 204, 196, 196),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Text(
                                "₹",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 142, 137, 137)),
                              )
                            ]),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: w * 0.07),
                        child: TextFormField(
                          onChanged: (content) {
                            amountConvert();
                          },
                          controller: txtEmail,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Enter the amount',
                            hintStyle:
                                TextStyle(fontSize: 13, color: Colors.black38),
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(8, 5, 0, 15),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 204, 196, 196)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 204, 196, 196)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    topRight: Radius.circular(7))),
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please enter check password';
                          //   }
                          //   return null;
                          // },
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter the amount';
                            }
                          },
                        ),
                      ),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     isCollapsed: true,
                      //     contentPadding:
                      //         const EdgeInsets.fromLTRB(8, 5, 0, 15),
                      //     hintText: "₹",
                      //     hintStyle: const TextStyle(
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w400,
                      //         color: Color.fromARGB(255, 142, 137, 137)),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(
                      //             color: Color.fromARGB(255, 204, 196, 196)),
                      //         borderRadius: BorderRadius.circular(8)),
                      //     focusedBorder: const OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 142, 137, 137)),
                      //     ),
                      //     border: const OutlineInputBorder(
                      //       borderRadius: BorderRadius.only(
                      //           // topLeft: Radius.circular(8),
                      //           // bottomLeft: Radius.circular(8),
                      //           ),
                      //     ),
                      //   ),
                      // ),
                    ]),

                    // Stack(children: [
                    //   TextFormField(
                    //     decoration: InputDecoration(
                    //       isCollapsed: true,
                    //       contentPadding:
                    //           const EdgeInsets.fromLTRB(8, 5, 0, 15),
                    //       hintText: "₹",
                    //       hintStyle: const TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w400,
                    //           color: Color.fromARGB(255, 142, 137, 137)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: const BorderSide(
                    //               color: Color.fromARGB(255, 204, 196, 196)),
                    //           borderRadius: BorderRadius.circular(8)),
                    //       focusedBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: Color.fromARGB(255, 142, 137, 137)),
                    //       ),
                    //       border: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.only(
                    //             // topLeft: Radius.circular(8),
                    //             // bottomLeft: Radius.circular(8),
                    //             ),
                    //       ),
                    //     ),
                    //   ),
                    //   Padding(
                    //     padding: EdgeInsets.only(left: w * 0.07),
                    //     child: TextFormField(
                    //       onChanged: (content) {
                    //         amountConvert();
                    //       },
                    //       controller: txtEmail,
                    //       keyboardType: TextInputType.number,
                    //       decoration: const InputDecoration(
                    //         hintText: 'Enter the amount',
                    //         hintStyle:
                    //             TextStyle(fontSize: 13, color: Colors.black38),
                    //         isCollapsed: true,
                    //         contentPadding: EdgeInsets.fromLTRB(8, 5, 0, 15),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: Color.fromARGB(255, 204, 196, 196)),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: Color.fromARGB(255, 204, 196, 196)),
                    //         ),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.only(
                    //                 bottomRight: Radius.circular(8),
                    //                 topRight: Radius.circular(8))),
                    //       ),
                    //       // validator: (value) {
                    //       //   if (value!.isEmpty) {
                    //       //     return 'Please enter check password';
                    //       //   }
                    //       //   return null;
                    //       // },
                    //       // ignore: body_might_complete_normally_nullable
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'Please Enter the amount';
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ]),
                    SizedBox(
                      height: h * 0.003,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.090),
                      child: Text(
                        "${amountConvertEn}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: h * 0.035,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Add Remarks",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "(Optional)",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SizedBox(
                      height: h * 0.053,
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
                                      horizontal: w * 0.016),
                                  child: Container(
                                      width: w * 0.29,

                                      // color: selectedContainerIndex ==
                                      //         index
                                      //     ? selectedColor
                                      //     : unselectedColor,
                                      // padding: EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                          // color: Colors.white,
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 235, 233, 233)),
                                          color: selectedContainerIndex == index
                                              ? selectedColor
                                              : unselectedColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          containerItems[index],
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      )),
                                )));
                          }),
                    ),
                    SizedBox(
                      height: h * 0.036,
                    ),
                    Container(
                      height: h * 0.16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromARGB(255, 223, 217, 217)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(69, 143, 145, 135),
                              blurRadius: 4,
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.03, vertical: h * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transfer Using",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff595A76)),
                                ),
                                Text(
                                  "Select another Account »",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 247, 151, 121)),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "XXXXXXX2987",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              255, 139, 145, 165)),
                                    ),
                                    SizedBox(
                                      height: h * 0.016,
                                    ),
                                    // SizedBox(
                                    //   height: h * 0.03,
                                    //   width: w * 0.373,
                                    //   child: ElevatedButton.icon(
                                    //       onPressed: () {},
                                    //       icon: Icon(
                                    //         Icons.check_circle,
                                    //         size: 13,
                                    //       ),
                                    //       label: Center(
                                    //           child: Text(
                                    //         "check Blance",
                                    //         style: TextStyle(fontSize: 12),
                                    //       ))),
                                    // ),
                                    Container(
                                      height: h * 0.023,
                                      width: w * 0.300,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                22),
                                        color:
                                            Color.fromARGB(255, 228, 232, 240)
                                                .withOpacity(1.0),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 6,
                                            backgroundColor: Color(0xff465A86),
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 10,
                                            ),
                                          ),
                                          Text(
                                            "Check Blance",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Color.fromARGB(
                                                    255, 83, 106, 189)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.0029,
                                    ),
                                  ],
                                ),
                                Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                      activeColor: Colors.green,
                                      focusColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      value: checkd,
                                      onChanged: (val) {
                                        setState(() {
                                          checkd = val!;
                                        });
                                      }),
                                ),
                              ],
                            ),

                            // SizedBox(
                            //   height: h * 0.033,
                            //   width: w * 0.3,
                            //   child: ElevatedButton(
                            //     onPressed: () {},
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.blue, // Background color
                            //     ),
                            //     child: const Text(
                            //       'Pay',
                            //       style: TextStyle(fontSize: 14),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: h * 0.03,
                            //   child: ElevatedButton.icon(
                            //       onPressed: () {},
                            //       icon: Icon(
                            //         Icons.check_circle,
                            //         size: 14,
                            //       ),
                            //       label: Text("check Blance")),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.20,
                    ),
                    // SizedBox(
                    //   height: h * 0.03,
                    // ),
                    SizedBox(
                      height: h * 0.051,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                            // ignore: prefer_is_empty
                            if (txtEmail.text.characters.length > 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DemtConfrmPay()));
                            }

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const DemtConfrmPay()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff6485B0)
                                  .withOpacity(1.0) // Background color
                              ),
                          child: const Center(
                            child: Text(
                              'PorceedsTO Conform',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 244, 239, 239)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),

                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ]),
            ),
          ),
        ));
  }
}
