// // ignore_for_file: unused_local_variable

// import 'dart:convert';

// import 'package:flutter_application_1/Json_model/userlogin.dart';
// import 'package:http/http.dart' as http;

// void LoginApi(String string) async {
//   try {
//     final Loginuser = await sendFormData();
//     print("Loginuser>>>>>>>>${Loginuser?.status}");
//     print("Loginuser>>>>>>>>${Loginuser?.data?[0].email}");
//     print("Loginuser>>>>>>>>${Loginuser?.data?[0].mobile}");
//     print('deactivate>>>>>>>>');
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// // ignore: body_might_complete_normally_nullable

// // ignore: body_might_complete_normally_nullable
// Future<LoginData?> sendFormData() async {
//   var headers = {
//     'deviceid': '123',
//     'Cookie': 'ASP.NET_SessionId=ndgeovms5dkuaex2ga1hbc1b'
//   };
//   var param = {'request': '{"MethodName":"getcompanydetails"}'};
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('https://sonitechno.info/api/mobileapi.aspx'));
//   request.fields.addAll(param);
//   request.headers.addAll(headers);
//   http.StreamedResponse response = await request.send();
//   //  print("response>>>>>>>${response}");

//   if (response.statusCode == 200) {
//     final result = await response.stream.bytesToString();
//     //print('result>>>>>>>>>>>${result}');

//     final jsonResponse = jsonDecode(result);

//     return LoginData.fromJson(jsonResponse);
//     // Map<String, dynamic> data = json.decode(result);

//     // return LoginData(
//     //   status: data['status'],
//     //   statuscode: data['statuscode'],
//     //   data: data['data'] as List<Datum>,
//     // );
//   } else {
//     print(response.reasonPhrase);
//   }
// }
// // void LoginApi() async {
// //   try {
// //     final Loginuser = await sendFormData();
// //     print("Loginuser>>>>>>>>${Loginuser?.status}");
// //     print("Loginuser>>>>>>>>${Loginuser?.data?[0].ownerName}");
// //     print("Loginuser>>>>>>>>${Loginuser?.data?[0].address}");
// //     print('deactivate>>>>>>>>');
// //     setState(() {
// //       var emailController;
// //       emailController.text = Loginuser?.data?[0].email as String;
// //       var passwordController;
// //       passwordController.text = Loginuser?.data?[0].mobile as String;
// //       var txtPass;
// //       print('deactivate>>>>>>>>${txtPass.text}');
// //     });
// //   } catch (e) {
// //     print('Error: $e');
// //   }
// // }

// // void setState(Null Function() param0) {}

// // Future<LoginData?> sendFormData() async {
// //   var headers = {
// //     'deviceid': '123',
// //     'Cookie': 'ASP.NET_SessionId=ndgeovms5dkuaex2ga1hbc1b'
// //   };
// //   var param = {'request': '{"MethodName":"getcompanydetails"}'};
// //   var request = http.MultipartRequest(
// //       'POST', Uri.parse('https://sonitechno.info/api/mobileapi.aspx'));
// //   request.fields.addAll(param);
// //   request.headers.addAll(headers);
// //   http.StreamedResponse response = await request.send();
// //   print("response>>>>>>>${response}");
// //   if (response.statusCode == 200) {
// //     final result = await response.stream.bytesToString();
// //     print('result>>>>>>>>>>>${result}');
// //     final jsonResponse = jsonDecode(result);
// //     return LoginData.fromJson(jsonResponse);
// //   } else {
// //     print(response.reasonPhrase);
// //   }
// // }










//  // Future login_API(var Mobile, var password) async {
//   //   try {
//   //     var response = await http
//   //         .post(Uri.parse("https://sonitechno.info/api/mobileapi.aspx"), body: {
//   //       'password': password,
//   //       "Mobile": Mobile,
//   //     });
//   //     print("${response}");

//   //     if (response.statusCode == 200) {

//   //       final data = json.decode(response.body.toString());

//   //       if (data['status' == 200]) {
//   //         // logging = true;
//   //         return true;
//   //       } else {
//   //         // logging = false;
//   //         false;
//   //       }
//   //     }
//   //   } catch (e) {}
//   // }













// //  Future<void> sendFormData() async {
//   //   var headers = {
//   //     'deviceid': '123',
//   //     'Cookie': 'ASP.NET_SessionId=ndgeovms5dkuaex2ga1hbc1b'
//   //   };
//   //   var request = http.MultipartRequest(
//   //       'POST', Uri.parse('https://sonitechno.info/api/mobileapi.aspx'));
//   //   request.fields.addAll({'request': '{"MethodName":"getcompanydetails"}'});

//   //   request.headers.addAll(headers);
//   //   http.StreamedResponse response = await request.send();
//   //   print("response>>>>>>>${response}");
//   //   if (response.statusCode == 200) {
//   //     final result = await response.stream.bytesToString();
//   //     print('result>>>>>>>>>>>${result}');
//   //   } else {
//   //     print(response.reasonPhrase);
//   //   }
//   // }






// /// Button ke on  tap pr call api 

// // 
// // TextButton(
// //                         style: ElevatedButton.styleFrom(
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(7)),
// //                           primary: const Color.fromARGB(255, 99, 194, 103),
// //                         ),
// //                         onPressed: () {
// //                           print("${passwordController.text}");
// //                           print("${emailController.text}");

// //                           sendFormData();
// //                           // Text(LoginData["email"].toString());

// //                           // login_API(mobileController.text.toString(),
// //                           //     passwordController.text.toString());
// //                           // sendFormData();

// //                           // login_API(mobileController.text.toString(),
// //                           //         passwordController.text.toString())
// //                           //     .then((value) => {
// //                           //           if (logging == true)
// //                           //             {
// //                           //               Navigator.push(
// //                           //                   context,
// //                           //                   MaterialPageRoute(
// //                           //                       builder: (Context) =>
// //                           //                           const PaytmTheme()))
// //                           //             }
// //                           //           else if (logging == false)
// //                           //             {print("False")}
// //                           //         });
// //                           // if (logging == true) {
// //                           //   Navigator.push(
// //                           //       context,
// //                           //       MaterialPageRoute(
// //                           //           builder: (Context) => const PaytmTheme()));
// //                           // } else if (logging == false) {
// //                           //   print("False");
// //                           // }
// //                         },
// //                         child: const Text("Log In",
// //                             style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //  
// //
// //
// //



// // print("${passwordController.text}");
// //  print("${emailController.text}");



// // Button  ke on tap pr call kra dena Funcation ko 


// // login_API(mobileController.text.trim(),passwordController.text.trim())













