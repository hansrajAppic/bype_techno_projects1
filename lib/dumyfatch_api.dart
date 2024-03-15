// // ignore_for_file: unnecessary_brace_in_string_interps

// import 'package:flutter/material.dart';

// import 'dart:convert';

// //import 'package:flutter_application_1/Json_model/userlogin.dart';
// import 'package:http/http.dart' as http;
// import 'package:paytm_apps/Json_model/datafatch_api.dart';

// class DumayApi extends StatefulWidget {
//   const DumayApi({super.key});

//   @override
//   State<DumayApi> createState() => _DumayState();
// }

// class _DumayState extends State<DumayApi> {
//   var Loginusers = '';
//   // final String = "data";

//   @override
//   void initState() {
//     super.initState();
//     LoginApi();
//   }

//   var LoginApiData = LoginApiModelData();

//   void LoginApi() async {
//     try {
//       final Loginuser = await sendFormData();
//       setState(() {
//         LoginApiData = Loginuser as LoginApiModelData;
//       });

//       print("LoginApiData email >>>>>>>>>>>>>>${LoginApiData.data?[0].email}");
//       print("Loginuser status >>>>>>>>${Loginuser?.status}");
//       print("Loginuser email >>>>>>>>${Loginuser?.data?[0].email}");
//       print("Loginuser>>>>>>>>${Loginuser?.data?[0].name}");
//       print("Loginuser>>>>>>>>${Loginuser?.data?[0].mobile}");
//       print('deactivate>>>>>>>>');
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   // ignore: body_might_complete_normally_nullable
//   Future<LoginApiModelData?> sendFormData() async {
//     var headers = {
//       'deviceid': '123',
//       'Cookie': 'ASP.NET_SessionId=ndgeovms5dkuaex2ga1hbc1b'
//     };
//     var param = {'request': '{"MethodName":"getcompanydetails"}'};
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('https://sonitechno.info/api/mobileapi.aspx'));
//     request.fields.addAll(param);
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     print("response>>>>>>>${response}");

//     if (response.statusCode == 200) {
//       final result = await response.stream.bytesToString();

//       print('result>>>>>>>>>>>${result}');

//       final jsonResponse = jsonDecode(result);
//       Loginusers = result.toString();

//       return LoginApiModelData.fromJson(jsonResponse);
//     } else {
//       print(response.reasonPhrase);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FutureBuilder(
//               future: sendFormData(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Text("loddain");
//                 } else {
//                   return SizedBox(
//                     height: 1900,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: LoginApiData.data?.length,
//                         scrollDirection: Axis.vertical,
//                         itemBuilder: (BuildContext context, index) {
//                           print(
//                               "LoginApiData length ${LoginApiData.data?.length}");
//                           var item = LoginApiData.data?[index];
//                           return Column(
//                             children: [
//                               Container(
//                                   color:
//                                       const Color.fromARGB(255, 211, 159, 155),
//                                   height: 1800,
//                                   width: double.infinity,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       SizedBox(
//                                         height: 40,
//                                       ),
//                                       // Card(
//                                       //   color: const Color.fromARGB(
//                                       //       255, 201, 225, 245),
//                                       //   child: Text(
//                                       //     "${Loginusers}",
//                                       //   ),
//                                       // ),
//                                       // Text('${item?.toString()}'),
//                                       // Text("${Loginusers}"),
//                                       // Text("${LoginApiModelData}"),

//                                       Text('${item?.email}'),
//                                       Text('${item?.instagram}'),
//                                       Text('${item?.mobile}'),
//                                       Text('${item?.address}'),
//                                       Text('${item?.name}'),
//                                       Text('${item?.youtube}'),
//                                       Text('${item?.isDelete}'),
//                                       Text('${item?.instagram}'),
//                                       Text('${item?.memberId}'),
//                                       Text('${item?.twiter}'),
//                                       Text('${item?.signature}'),
//                                       Text('${item?.ownerName}'),
//                                       Text('${item?.id}'),
//                                       Text('${item?.address}'),
//                                       Text('${item?.name}'),
//                                       Row(
//                                         children: [
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 sendFormData();
//                                               },
//                                               child: Text("data")),
//                                           Text("poewerdbay${poewerdbay}"),
//                                         ],
//                                       ),
//                                     ],
//                                   )),
//                               // Container(
//                               //     color: Colors.red,
//                               //     height: 50,
//                               //     child: Text('${item?.mobile}')),
//                               Text("${hansraj}"),
//                             ],
//                           );
//                         }),
//                   );
//                 }
//               })
//         ],
//       ),
//     ));
//   }
// }

// mixin jsonResponse {}

// class Loginuser {}

// mixin hansraj {}

// mixin poewerdbay {}
