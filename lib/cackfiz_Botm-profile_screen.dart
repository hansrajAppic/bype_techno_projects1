import 'package:flutter/material.dart';
import 'package:paytm_apps/cackefize_logout_scrren.dart';
import 'package:paytm_apps/cackefizee_profile_2.dart';
import 'package:paytm_apps/cackfize_myoder_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
                height: h * 0.46,
                width: double.infinity,
                color: const Color.fromARGB(255, 148, 147, 147),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        maxRadius: 70,
                        backgroundColor: Color.fromARGB(255, 37, 17, 115),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 90,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CackeFizeProfile2_Screen()),
                          );
                        },
                        child: const CircleAvatar(
                          maxRadius: 20,
                          child: Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.026),
            child: Container(
              height: h * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 241, 228, 228)),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(69, 143, 145, 135),
                      blurRadius: 4,
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.036, vertical: h * 0.027),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CackeFizeMyOder()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.post_add,
                            size: 27,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          const Text(
                            "My Orders",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 174, 166, 166)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CackeFizeMyOder()),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              size: 27,
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            const Text(
                              "My Cart",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 174, 166, 166)),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CackeFizeMyOder()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.card_travel,
                            size: 27,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          const Text(
                            "My Wishlist",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 174, 166, 166)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CackefizeLogouctScrreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.logout,
                            size: 27,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 174, 166, 166)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
