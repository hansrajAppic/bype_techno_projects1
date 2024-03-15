// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Json_model/userlogin.dart';
// import 'package:flutter_application_1/postApi.dart';\
//  import 'dart:convert';

// import 'package:flutter_application_1/Json_model/userlogin.dart';
// import 'package:http/http.dart' as http;

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {





 

// void LoginApi() async {
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
//   print("response>>>>>>>${response}");
//   if (response.statusCode == 200) {
//     final result = await response.stream.bytesToString();
//     print('result>>>>>>>>>>>${result}');
//     final jsonResponse = jsonDecode(result);
//     return LoginData.fromJson(jsonResponse);
//   } else {
//     print(response.reasonPhrase);
//   }
// }






//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: FutureBuilder(future: sendFormData() ,
//         builder: (context, snapshot) {
//           if(!snapshot.hasData){
//             return Text("loding");
//           }else{
//             return ListView.builder(shrinkWrap: true,
//             scrollDirection:  Axis.vertical,
            
//               itemCount: LoginData.length,
//               itemBuilder: (BuildContext context, index) {
//               return Card(
//                 child: Column(mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                Text("Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
//               Text(LoginData[String].title.toString()),
//               Text(LoginData[index].body.toString()),
//               SizedBox(height: 5,),
//              Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
//                   Text("Description"+LoginData[index].title.toString()),
//                 ],)
                  
                
              
            
//             );
    
//   });
//           }
//         }
//    ) );
//   }
// }