// class data {
//   var animalList = ['dog', 'cat', 'cow',];

//   // function for printing the list of animals
//         static void animalListPrinter() {
//     // for (var data in animalList) {
//     //   print(data);
//     // }
//         print('Static function called from MyClass');

import 'package:get_ip_address/get_ip_address.dart';

dynamic ip = "";

class MyClass {
  static Future<void> myStaticFunction() async {
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      ip = data;
      print(">>>>>>>>>>>>>> api call ho rhi hai ${ip.toString()}");
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      print(exception.message);
    }
  }
}
