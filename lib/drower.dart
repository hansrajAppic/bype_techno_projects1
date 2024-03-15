import 'package:flutter/material.dart';

class Drowers extends StatefulWidget {
  const Drowers({super.key});

  @override
  State<Drowers> createState() => _DrowersState();
}

class _DrowersState extends State<Drowers> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.red,
      ),
    );
  }
}
