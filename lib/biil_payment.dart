import 'package:flutter/material.dart';
import 'package:paytm_apps/list_map.dart';

class BilPayment extends StatefulWidget {
  const BilPayment({super.key});

  @override
  State<BilPayment> createState() => _BilPaymentState();
}

class _BilPaymentState extends State<BilPayment> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
              Padding(
                padding: EdgeInsets.only(left: w * 0.24),
                child: const Center(
                  child: Text(
                    "Bill Payment",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          leadingWidth: 14,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "All Services",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: h * 0.014,
                  ),
                  Container(
                    height: h * 0.42,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 163, 174, 120),
                            blurRadius: 1,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.02, left: w * 0.04),
                          child: const Text(
                            "Utility",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 246, 235, 235),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * 0.34,
                              child: GridView.builder(
                                  itemCount: UtilityArrayName.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 8 / 6,
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(),
                                      child: (Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            UtilityArrayName[index]["image"],
                                            height: 30,
                                          ),
                                          Text(
                                            UtilityArrayName[index]["title"],
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Container(
                    height: h * 0.42,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(69, 163, 174, 120),
                            blurRadius: 1,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.02, left: w * 0.04),
                          child: const Text(
                            "Recharge",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 246, 235, 235),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * 0.34,
                              child: GridView.builder(
                                  itemCount: RechageArrayName.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 8 / 6,
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(),
                                      child: (Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 24,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 224, 202, 200),
                                            child: Image.asset(
                                              RechageArrayName[index]["image"],
                                              height: 30,
                                            ),
                                          ),
                                          Text(
                                            RechageArrayName[index]["title"],
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
