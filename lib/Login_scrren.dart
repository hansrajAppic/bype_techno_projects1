// ignore_for_file: unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, file_names, avoid_print, duplicate_ignore, unnecessary_brace_in_string_interps, sized_box_for_whitespace, deprecated_member_use, unnecessary_string_interpolations, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_application_1/Json_model/userlogin.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_apps/Json_model/datafatch_api.dart';
import 'package:paytm_apps/Json_model/modelnetworkimage.dart';
import 'package:paytm_apps/Json_model/userloginmodel.dart';
import 'package:paytm_apps/paytem_them.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //  LoginData loginData = LoginData.fromJson(json.decode(yourJsonString));

  var LoginDAta = "";
  var poewerdbay = "";
  var facbook = "";

  // var LoginApiModelData = sendFormData();

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController RestpasswordController = TextEditingController();
  TextEditingController Rest1passwordController = TextEditingController();
  // ignore: non_constant_ide newntifier_names
  bool _ischeckd = false;
  bool _isLoading = false;

  // List<Datum>? Data;
  LoginData user = LoginData();

  bool _passwordVisible = true;
  bool _passwordVisibles = true;

  bool logging = false;
  dynamic response;
  void printmasge() {
    print("user accepet aggrement");
  }

  // static get yourJsonString => null;
  // final _formKey = GlobalKey<FormState>();
 final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Data = sendFormData().then((value) => value?.data) as List<Datum>?;
      final hh = sendFormData();
      LoginApi();

      // ignore: avoid_print
      // print(hh.then((value) => value?.email));

      setState(() {});
    });
  }

  var LoginApiData = LoginApiModelData();

  void LoginApi() async {
    try {
      final Loginuser = await sendFormData();
      setState(() {
        LoginApiData = Loginuser as LoginApiModelData;
      });
      LoginDAta = Loginuser!.data![0].name!;
      // facbook = Loginuser.data![0].youtube!;
      // poewerdbay = Loginuser.data![0].email!;

      // print("LoginApiData email >>>>>>>>>>>>>>${LoginApiData.data?[0].email}");
      // // ignore: avoid_print
      // print("Loginuser status >>>>>>>>${Loginuser.status}");
      // print("Loginuser email >>>>>>>>${Loginuser.data?[0].email}");
      // print("Loginuser>>>>>>>>${Loginuser.data?[0].name}");
      // print("Loginuser>>>>>>>>${Loginuser.data?[0].mobile}");
      // print('deactivate>>>>>>>>');
    } catch (e) {
      print('Error: $e');
    }
  }
  

  // ignore: body_might_complete_normally_nullable
  Future<LoginApiModelData?> sendFormData() async {
    
    var headers = {
      'deviceid': '123',
      'Cookie': 'ASP.NET_SessionId=ndgeovms5dkuaex2ga1hbc1b'
    };

    var param = {
      'Request':
          ' ({"MethodName":"getlogindetails","UserID":"9549324328","Password":"9549324328", "AppType": " Apps" })',
      'Password': passwordController.text.toString(),
      'Mobile': emailController.text.toString()
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://sonitechno.info/api/mobileapi.aspx'));
    request.fields.addAll(param);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("response>>>>>>>${response}");

    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();

      print('results>>>>>>>>>>>${result}');
      final jsonResponse = jsonDecode(result);

      return LoginApiModelData.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
    }
  }
//

  Future<void> PostmodalApi() async {
    var headers = {
      'DeviceID': '123',
      'Cookie':
          'ASP.NET_SessionId=gg5uofsoxsrba1uv0egdcwrg; ASP.NET_SessionId=b4qkrzbfle40tws0hkysbufq'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://sonitechno.info/api/mobileapi.aspx"));

    request.fields.addAll({
      'Request':
          '{"MethodName":"getlogindetails","UserID":"${emailController.text}","Password":"${passwordController.text}", "AppType": " Apps"  }'
    });
    
    try {
      request.headers.addAll(headers);

      http.Response response =
          await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // ip = data;

        Map<String, dynamic> userJson = json.decode(response.body);
        if (data["statuscode"] == "TXN") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              '${data["status"].toString()}',
              style: TextStyle(fontSize: 10),
            )),
          );
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaytmTheme()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
              '${data["status"].toString()}',
              style: TextStyle(fontSize: 10),
            )),
          );
        }

        print(">>>>>>>>>>>>>>>>>>> api call ho rhi hai ${data.toString()}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    sendFormData();
    // ignore: prefer_typing_uninitialized_variables
    var item;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 220,
                  width: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: h * 0.344,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(69, 143, 145, 135),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),

                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          obscureText: _passwordVisibles,
                          // keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.allow(
                          //       RegExp('r'[1 - 9])),
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.number,

                          controller: emailController,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 0, 15),
                            hintText: "Mobile",
                            hintStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisibles
                                      ? Icons.phone
                                      // : Icons.visibility_off,
                                      : Icons.phone,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisibles = !_passwordVisibles;
                                  });
                                }),
                            border: const UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter  Mobile Num';
                            }
                            return null;
                          },
                        ),
                        // SizedBox(
                        //   height: h * 0.01,
                        // ),
                        TextFormField(
                          obscureText: _passwordVisible,
                          controller: passwordController,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 0, 15),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                }),
                            border: const UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: h * 0.034,
                        ),

                        Center(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter bottomState) {
                                            
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom +
                                              0,
                                          top: 9),
                                      // ignore: sized_box_for_whitespace
                                      child: Container(
                                        height: h * 0.54,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30,
                                              vertical: h * 0.04),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Text(
                                                ' Forgot password',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              SizedBox(
                                                height: h * 0.03,
                                              ),
                                              const Text(
                                                "Enter Your mobile for the verifaction proccess",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const Text(
                                                "we will send 4 digets code to your",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.037,
                                              ),
                                              const Text(
                                                "Mobile",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.024,
                                              ),

                                              TextFormField(
                                                obscureText: _passwordVisible,
                                                controller: mobileController,
                                                decoration: InputDecoration(
                                                  isCollapsed: true,
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 15, 0, 15),
                                                  hintText: "Mobile",
                                                  hintStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        _passwordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                        color: Theme.of(context)
                                                            .primaryColorDark,
                                                      ),
                                                      onPressed: () {
                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                        // setState(() {
                                                        //   _passwordVisible =
                                                        //       !_passwordVisible;
                                                        // });

                                                        bottomState(() {
                                                          _passwordVisible =
                                                              !_passwordVisible;
                                                        });
                                                      }),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter check password';
                                                  }
                                                  return null;
                                                },
                                              ),

                                              SizedBox(
                                                height: h * 0.043,
                                              ),

                                              SizedBox(
                                                  height: h * 0.065,
                                                  width: double.infinity,
                                                  child: TextButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22)),
                                                        primary: const Color
                                                            .fromARGB(
                                                            255, 99, 194, 103),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: MediaQuery.of(context)
                                                                            .viewInsets
                                                                            .bottom +
                                                                        0,
                                                                    top: 0),
                                                                child:
                                                                    (Container(
                                                                  height:
                                                                      h * 0.54,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            30,
                                                                        vertical:
                                                                            50),
                                                                    child: Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          const Text(
                                                                            "Enter 4 Digits Code",
                                                                            style:
                                                                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                h * 0.04,
                                                                          ),
                                                                          const Text(
                                                                            "Enter 4  the Digits Code that you received on/n your mobile",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 15,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                h * 0.04,
                                                                          ),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                SizedBox(
                                                                                    height: 48,
                                                                                    width: 40,
                                                                                    child: TextField(
                                                                                      textAlign: TextAlign.center,
                                                                                      keyboardType: TextInputType.number,
                                                                                      maxLength: 1,
                                                                                      cursorColor: Theme.of(context).primaryColor,
                                                                                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                      onChanged: (value) {
                                                                                        if (value.length == 1) {
                                                                                          FocusScope.of(context).nextFocus();
                                                                                        }
                                                                                      },
                                                                                    )),
                                                                                SizedBox(
                                                                                    height: 48,
                                                                                    width: 40,
                                                                                    child: TextField(
                                                                                      textAlign: TextAlign.center,
                                                                                      keyboardType: TextInputType.number,
                                                                                      maxLength: 1,
                                                                                      cursorColor: Theme.of(context).primaryColor,
                                                                                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                      onChanged: (value) {
                                                                                        if (value.length == 1) {
                                                                                          FocusScope.of(context).nextFocus();
                                                                                        }
                                                                                      },
                                                                                    )),
                                                                                SizedBox(
                                                                                    height: 48,
                                                                                    width: 40,
                                                                                    child: TextField(
                                                                                      textAlign: TextAlign.center,
                                                                                      keyboardType: TextInputType.number,
                                                                                      maxLength: 1,
                                                                                      cursorColor: Theme.of(context).primaryColor,
                                                                                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                      onChanged: (value) {
                                                                                        if (value.length == 1) {
                                                                                          FocusScope.of(context).nextFocus();
                                                                                        }
                                                                                      },
                                                                                    )),
                                                                                SizedBox(
                                                                                    height: 48,
                                                                                    width: 40,
                                                                                    child: TextField(
                                                                                      textAlign: TextAlign.center,
                                                                                      keyboardType: TextInputType.number,
                                                                                      maxLength: 1,
                                                                                      cursorColor: Theme.of(context).primaryColor,
                                                                                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                                      onChanged: (value) {
                                                                                        if (value.length == 1) {
                                                                                          FocusScope.of(context).nextFocus();
                                                                                        }
                                                                                      },
                                                                                    )),
                                                                              ]),
                                                                          SizedBox(
                                                                            height:
                                                                                h * 0.04,
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(vertical: 20),
                                                                            child: SizedBox(
                                                                                height: 52,
                                                                                width: 335,
                                                                                child: TextButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                    primary: Colors.green,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                    const SizedBox(
                                                                                      height: 200,
                                                                                    );

                                                                                    showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return StatefulBuilder(builder: (BuildContext context, StateSetter bottomState) {
                                                                                            return Padding(
                                                                                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom - 0, top: 9),
                                                                                              child: Container(
                                                                                                height: h * 0.55,
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                                                                                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                                    const Text(
                                                                                                      "Rest Password",
                                                                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: h * 0.02,
                                                                                                    ),
                                                                                                    const Text(
                                                                                                      " Set the new password four your accounts so\n you can login and access all the features",
                                                                                                      style: TextStyle(
                                                                                                        fontSize: 15,
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: h * 0.04,
                                                                                                    ),
                                                                                                    TextFormField(
                                                                                                      obscureText: _passwordVisible,
                                                                                                      controller: RestpasswordController,
                                                                                                      decoration: InputDecoration(
                                                                                                        isCollapsed: true,
                                                                                                        contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                                                                                                        labelText: "Password",
                                                                                                        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                                        suffixIcon: IconButton(
                                                                                                            icon: Icon(
                                                                                                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                              color: Theme.of(context).primaryColorDark,
                                                                                                            ),
                                                                                                            onPressed: () {
                                                                                                              bottomState(() {
                                                                                                                _passwordVisible = !_passwordVisible;
                                                                                                              });
                                                                                                            }),
                                                                                                        border: OutlineInputBorder(
                                                                                                          borderRadius: BorderRadius.circular(22),
                                                                                                        ),
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
                                                                                                    TextFormField(
                                                                                                      obscureText: _passwordVisible,
                                                                                                      controller: Rest1passwordController,
                                                                                                      decoration: InputDecoration(
                                                                                                        isCollapsed: true,
                                                                                                        contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                                                                                                        labelText: "Password",
                                                                                                        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                                        suffixIcon: IconButton(
                                                                                                            icon: Icon(
                                                                                                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                              color: Theme.of(context).primaryColorDark,
                                                                                                            ),
                                                                                                            onPressed: () {
                                                                                                              bottomState(() {
                                                                                                                _passwordVisible = !_passwordVisible;
                                                                                                              });
                                                                                                            }),
                                                                                                        border: OutlineInputBorder(
                                                                                                          borderRadius: BorderRadius.circular(22),
                                                                                                        ),
                                                                                                      ),
                                                                                                      validator: (value) {
                                                                                                        if (value!.isEmpty) {
                                                                                                          return 'Please enter check password';
                                                                                                        }
                                                                                                        return null;
                                                                                                      },
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: h * 0.018,
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.symmetric(
                                                                                                        vertical: 20,
                                                                                                      ),
                                                                                                      child: SizedBox(
                                                                                                          height: 51,
                                                                                                          width: 335,
                                                                                                          child: TextButton(
                                                                                                            style: ElevatedButton.styleFrom(
                                                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                                                                                                              primary: Colors.green,
                                                                                                            ),
                                                                                                            onPressed: () {
                                                                                                              Navigator.of(context).pop();
                                                                                                            },
                                                                                                            child: const Text(
                                                                                                              "Reset Password",
                                                                                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                                            ),
                                                                                                          )),
                                                                                                    ),
                                                                                                  ]),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          });
                                                                                        });
                                                                                  },
                                                                                  child: const Text(
                                                                                    "Continue",
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                )),
                                                              );
                                                            });
                                                      },
                                                      child: const Text(
                                                          "Continue",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)))),

                                              // ElevatedButton(
                                              //   onPressed: () {
                                              //     // Close the bottom sheet when the button is pressed.
                                              //     Navigator.of(context).pop();
                                              //   },
                                              //   child: Text('Close'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                            child: const Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Text("  Forgot password?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: !_isLoading
                    ? const Text("")
                    : const CircularProgressIndicator(),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Checkbox(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10)),
              //         value: Name,
              //         onChanged: (val) {
              //           setState(() {
              //             Name = val!;
              //           });
              //         }),
              //     const Column(
              //       children: [
              //         SizedBox(
              //           height: 14,
              //         ),
              //         Text(
              //           "Remember me ",
              //           style: TextStyle(
              //               fontSize: 14,
              //               color: Color.fromRGBO(119, 105, 105, 1)),
              //         ),
              //       ],
              //     ),
              //     const Spacer(),
              //     SizedBox(
              //         height: h * 0.064,
              //         width: w * 0.4,
              //         child: TextButton(
              //             style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(7)),
              //               primary: const Color.fromARGB(255, 99, 194, 103),
              //             ),
              //             onPressed: () {
              //               if (_formKey.currentState!.validate()) {
              //                 ScaffoldMessenger.of(context).showSnackBar(
              //                   const SnackBar(
              //                       content: Text(
              //                     'Processing Data',
              //                     style: TextStyle(fontSize: 10),
              //                   )),
              //                 );
              //               }
              //               print("${passwordController.text}");
              //               print("${emailController.text}");

              //               // sendFormData(
              //               //     // passwordController.text.toString(),
              //               //     // emailController.text.toString(),
              //               //     );

              //               //   Lo(emailController.text.toString(),
              //               //  passwordController.text.toString());

              //               //               },
              //               // var gg = sendFormData();

              //               // sendFormData();
              //               // Navigator.push(
              //               //     context,
              //               //     MaterialPageRoute(
              //               //         builder: (Context) => const PaytmTheme()));

              //               // Text(LoginData["email"].toString());

              //               // login_API(mobileController.text.toString(),
              //               //     passwordController.text.toString());
              //               // sendFormData();

              //               // getpostApi(mobileController.text.toString(),
              //               //         emailController.text.toString())
              //               //     .then((value) => {
              //               //           if (logging == true)
              //               //             {
              //               //               Navigator.push(
              //               //                   context,
              //               //                   MaterialPageRoute(
              //               //                       builder: (Context) =>
              //               //                           const PaytmTheme()))
              //               //             }
              //               //           else if (logging == false)
              //               //             {print("False")}
              //               //         });
              //               // if (logging == true) {
              //               //   Navigator.push(
              //               //       context,
              //               //       MaterialPageRoute(
              //               //           builder: (Context) => const PaytmTheme()));
              //               // } else if (logging == false) {
              //               //   print("False");
              //               //
              //               // loginApipostman();

              //               // if (logging == true) {
              //               //   Navigator.push(
              //               //       context,
              //               //       MaterialPageRoute(
              //               //           builder: (Context) =>
              //               //               const PaytmTheme()));
              //               // } else if (logging == false) {
              //               //   print("False");
              //               // }
              //               loginApipostman().then((value) => {
              //                     if (logging == true)
              //                       {
              //                         Navigator.push(
              //                             context,
              //                             MaterialPageRoute(
              //                                 builder: (Context) =>
              //                                     const PaytmTheme()))
              //                       }
              //                     else if (logging == false)
              //                       {print("False")}
              //                   });
              //             },
              //             child: const Text("Log In",
              //                 style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white)))),
              //     SizedBox(
              //       width: w * 0.06,
              //     ),
              //   ],
              // ),
              TextButton(
                  onPressed: () {
                    sendFormData();
                  },
                  child: Text("aa")),

              ListTile(
                leading: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: _ischeckd,
                    onChanged: (bool? val) {
                      setState(() {
                        _ischeckd = val!;
                      });
                    }),
                title: Align(
                  child: new Text(
                    "Remember me ",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(119, 105, 105, 1)),
                  ),
                  alignment: Alignment(-1.8, 0),
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: h * 0.004),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      PostmodalApi();

                      if (_formKey.currentState!.validate()) {}
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Logain",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    textColor: Colors.white,
                    color: Colors.green,
                  ),
                ),
              ),

              SizedBox(
                height: h * 0.03,
              ),

              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 29.0, right: 7.0),
                      child: const Divider(
                        color: Color.fromARGB(255, 176, 168, 168),
                        height: 52,
                      )),
                ),
                const Text(
                  "Socical Login",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(150, 129, 129, 1)),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 7.0, right: 29.0),
                      child: const Divider(
                        color: Color.fromARGB(255, 192, 170, 170),
                        height: 50,
                      )),
                ),
              ]),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            " - ${facbook}",
                            style: const TextStyle(color: Colors.blue),
                          ),
                          action: SnackBarAction(
                            textColor: Colors.blue,
                            label: 'Delete',
                            onPressed: () {
                              setState(() {});
                              // setState(() {
                              //   ChackoutDelevryArrayName.removeAt(
                              //
                              // Code to execute.
                            },
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/facbook.png",
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  Image.asset(
                    "assets/images/twitter-removebg-preview.png",
                    height: 38,
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  // InkWell(
                  //   onTap: () async {
                  //     const url = "https://www.instagram.com/";
                  //     if (await canLaunch(url)) {
                  //       await launch(url);
                  //     } else {
                  //       throw 'Could not launch $url';
                  //     }
                  //   },
                  //   child:
                  Image.asset(
                    "assets/images/instagram-removebg-preview.png",
                    height: 36,
                  ),

                  SizedBox(
                    width: w * 0.03,
                  ),
                  Image.asset(
                    "assets/images/whatshapss.png",
                    height: 40,
                  )
                ],
              ),
              SizedBox(
                height: h * 0.034,
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New user?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text("Signup",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        )),
                  ],
                ),
              ),
              // IconButton(
              //     icon: Icon(
              //       Icons.ac_unit,
              //     ),
              //     onPressed: () async {
              //       const url = '';
              //       if (await canLaunch(url)) {
              //         await launch(url);
              //       } else {
              //         throw 'Could not launch $url';
              //       }
              //     }),
              // IconButton(
              //   icon: Icon(
              //     Icons.ac_unit,
              //   ),
              //   onPressed: () => launch('https://twitter.com'),
              // ),
              SizedBox(
                height: h * 0.003,
              ),
              Center(child: Text(" powerd by - ${LoginDAta}")),
              SizedBox(
                height: h * 0.033,
              ),
            ]),
      ),
    ));
  }

  Padding container(double h, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: h * 0.32,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffFFFFFF),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(69, 143, 145, 135),
                blurRadius: 4,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                " Login",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                obscureText: _passwordVisibles,
                controller: emailController,
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Mobile",
                  hintStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisibles
                            ? Icons.phone
                            // : Icons.visibility_off,
                            : Icons.phone,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisibles = !_passwordVisibles;
                        });
                      }),
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
                height: h * 0.01,
              ),
              TextFormField(
                obscureText: _passwordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                  hintText: "Password",
                  hintStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }),
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
                height: h * 0.034,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter bottomState) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        0,
                                top: 9),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          0,
                                  top: 9),
                              child: Container(
                                height: h * 0.54,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        ' Forgot password',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(
                                        height: h * 0.04,
                                      ),
                                      const Text(
                                        "Enter Your mobile for the verifaction proccess",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        "we will send 4 digets code to your",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.04,
                                      ),
                                      const Text(
                                        "Mobile",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),

                                      TextFormField(
                                        obscureText: _passwordVisible,
                                        controller: mobileController,
                                        decoration: InputDecoration(
                                          isCollapsed: true,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 15, 0, 15),
                                          hintText: "Mobile",
                                          hintStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                // setState(() {
                                                //   _passwordVisible =
                                                //       !_passwordVisible;
                                                // });

                                                bottomState(() {
                                                  _passwordVisible =
                                                      !_passwordVisible;
                                                });
                                              }),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                          ),
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

                                      SizedBox(
                                          height: h * 0.065,
                                          width: double.infinity,
                                          child: TextButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                                primary: const Color.fromARGB(
                                                    255, 99, 194, 103),
                                              ),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom +
                                                                0,
                                                            top: 9),
                                                        child: (Container(
                                                          height: h * 0.54,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        50),
                                                        child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                    "Enter 4 Digits Code",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.04,
                                                                  ),
                                                                  const Text(
                                                                    "Enter 4  the Digits Code that you received on \n your mobile",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.04,
                                                                  ),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                            height:
                                                                                48,
                                                                            width:
                                                                                40,
                                                                            child:
                                                                                TextField(
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: TextInputType.number,
                                                                              maxLength: 1,
                                                                              cursorColor: Theme.of(context).primaryColor,
                                                                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                              onChanged: (value) {
                                                                                if (value.length == 1) {
                                                                                  FocusScope.of(context).nextFocus();
                                                                                }
                                                                              },
                                                                            )),
                                                                        SizedBox(
                                                                            height:
                                                                                48,
                                                                            width:
                                                                                40,
                                                                            child:
                                                                                TextField(
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: TextInputType.number,
                                                                              maxLength: 1,
                                                                              cursorColor: Theme.of(context).primaryColor,
                                                                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                              onChanged: (value) {
                                                                                if (value.length == 1) {
                                                                                  FocusScope.of(context).nextFocus();
                                                                                }
                                                                              },
                                                                            )),
                                                                        SizedBox(
                                                                            height:
                                                                                48,
                                                                            width:
                                                                                40,
                                                                            child:
                                                                                TextField(
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: TextInputType.number,
                                                                              maxLength: 1,
                                                                              cursorColor: Theme.of(context).primaryColor,
                                                                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                              onChanged: (value) {
                                                                                if (value.length == 1) {
                                                                                  FocusScope.of(context).nextFocus();
                                                                                }
                                                                              },
                                                                            )),
                                                                        SizedBox(
                                                                            height:
                                                                                48,
                                                                            width:
                                                                                40,
                                                                            child:
                                                                                TextField(
                                                                              textAlign: TextAlign.center,
                                                                              keyboardType: TextInputType.number,
                                                                              maxLength: 1,
                                                                              cursorColor: Theme.of(context).primaryColor,
                                                                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)), counterText: '', hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
                                                                              onChanged: (value) {
                                                                                if (value.length == 1) {
                                                                                  FocusScope.of(context).nextFocus();
                                                                                }
                                                                              },
                                                                            )),
                                                                      ]),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.04,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            20),
                                                                    child: SizedBox(
                                                                        height: 52,
                                                                        width: 335,
                                                                        child: TextButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                            primary:
                                                                                Colors.green,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            const SizedBox(
                                                                              height: 200,
                                                                            );

                                                                            showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return StatefulBuilder(builder: (BuildContext context, StateSetter bottomState) {
                                                                                    return Padding(
                                                                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom - 0, top: 9),
                                                                                      child: Container(
                                                                                        height: h * 0.55,
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                                                                          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                            const Text(
                                                                                              "Rest Password",
                                                                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: h * 0.02,
                                                                                            ),
                                                                                            const Text(
                                                                                              " Set the new password four your accounts so\n you can login and access all the features",
                                                                                              style: TextStyle(
                                                                                                fontSize: 15,
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: h * 0.04,
                                                                                            ),
                                                                                            TextFormField(
                                                                                              obscureText: _passwordVisible,
                                                                                              controller: RestpasswordController,
                                                                                              decoration: InputDecoration(
                                                                                                isCollapsed: true,
                                                                                                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                                                                                                labelText: "Password",
                                                                                                hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                                suffixIcon: IconButton(
                                                                                                    icon: Icon(
                                                                                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                      color: Theme.of(context).primaryColorDark,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      bottomState(() {
                                                                                                        _passwordVisible = !_passwordVisible;
                                                                                                      });
                                                                                                    }),
                                                                                                border: OutlineInputBorder(
                                                                                                  borderRadius: BorderRadius.circular(22),
                                                                                                ),
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
                                                                                            TextFormField(
                                                                                              obscureText: _passwordVisible,
                                                                                              controller: Rest1passwordController,
                                                                                              decoration: InputDecoration(
                                                                                                isCollapsed: true,
                                                                                                contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                                                                                                labelText: "Password",
                                                                                                hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                                suffixIcon: IconButton(
                                                                                                    icon: Icon(
                                                                                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                                                      color: Theme.of(context).primaryColorDark,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      bottomState(() {
                                                                                                        _passwordVisible = !_passwordVisible;
                                                                                                      });
                                                                                                    }),
                                                                                                border: OutlineInputBorder(
                                                                                                  borderRadius: BorderRadius.circular(22),
                                                                                                ),
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
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.symmetric(
                                                                                                vertical: 22,
                                                                                              ),
                                                                                              child: SizedBox(
                                                                                                  height: 52,
                                                                                                  width: 335,
                                                                                                  child: TextButton(
                                                                                                    style: ElevatedButton.styleFrom(
                                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                                                                                                      primary: Colors.green,
                                                                                                    ),
                                                                                                    onPressed: () {},
                                                                                                    child: const Text(
                                                                                                      "Reset Password",
                                                                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                                    ),
                                                                                                  )),
                                                                                            ),
                                                                                          ]),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  });
                                                                                });
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "Continue",
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.white),
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ]),
                                                          ),
                                                        )),
                                                      );
                                                    });
                                              },
                                              child: const Text("Continue",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)))),

                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     // Close the bottom sheet when the button is pressed.
                                      //     Navigator.of(context).pop();
                                      //   },
                                      //   child: Text('Close'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("  Forgot password?",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

launch(String url, {required bool forceSafariVC}) {}

canLaunch(String url) {}
