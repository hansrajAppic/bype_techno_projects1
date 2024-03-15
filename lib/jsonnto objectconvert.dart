import 'dart:convert';

import 'package:paytm_apps/object_json.dart';

// JSON response string
void name() {
  String SignUpResponse = '''
{
  'kycmessage'        "",
  'Pan'               "",
  'Aadhar'            "",
  'Adddate'           "",
  'IsKycApproved'     "",
  'RoleID'            "",
  'STATUS'            "",
  'USERNAME'          "",
  'MOBILENUMBER'      "",
  'PackageId'         "",
  'WBalance'          "",
  'Email'             "",
  'USERID'            "",
  'LoginPin'          "",
  'IsSystemOn'        "",
  'IsAuthorized'      "",
  'userimage'         "",
  'ActiveProfile'     "",
  'ProfileAmount'      "",
  
}
''';

  Map<String, dynamic> parsedJson = json.decode(SignUpResponse);

  User user = User.fromJson(parsedJson);
  print('User ID: ${user.data}');
// print('User Name: ${user.name}');
// print('User Email: ${user.email}');
}
