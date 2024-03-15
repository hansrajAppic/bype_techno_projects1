// // import 'package:flutter/material.dart';

// // class OTPScreen extends StatefulWidget {
// //   const OTPScreen({Key? key}) : super(key: key);

// //   @override
// //   _OTPScreenState createState() => _OTPScreenState();
// // }

// // class _OTPScreenState extends State<OTPScreen> {
// //   final TextEditingController otpController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('OTP Verification'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               // OTP Input Fields
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: List.generate(
// //                   4,
// //                   (index) => SizedBox(
// //                     width: 50.0,
// //                     child: TextFormField(
// //                       controller: otpController,
// //                       keyboardType: TextInputType.number,
// //                       textAlign: TextAlign.center,
// //                       maxLength: 1,
// //                       decoration: InputDecoration(
// //                         enabledBorder: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(11),
// //                           borderSide: const BorderSide(
// //                             color: Color.fromARGB(255, 213, 195, 195),
// //                           ),
// //                         ),
// //                         filled: true,
// //                         fillColor: const Color.fromARGB(255, 245, 234, 234),
// //                         contentPadding: const EdgeInsets.all(0),
// //                         counterText: '',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(11),
// //                         ),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return 'Please enter a digit';
// //                         }
// //                         return null;
// //                       },
// //                       onChanged: (value) {
// //                         if (value.length == 1 && index < 3) {
// //                           FocusScope.of(context).nextFocus();
// //                         } else if (value.length == 0 && index > 0) {
// //                           FocusScope.of(context).previousFocus();
// //                         }
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //               ),

// //               // Validation Message
// //               if (_formKey.currentState?.validate() ?? false)
// //                 Text(
// //                   'Please correct the errors above',
// //                   style: TextStyle(color: Colors.red),
// //                 ),

// //               // Submit Button
// //               SizedBox(
// //                 height: 20.0,
// //               ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     // Your validation was successful, perform further actions
// //                     // For example, check if the entered OTP is correct
// //                     String enteredOTP = otpController.text;
// //                     // Implement your OTP validation logic here
// //                     print('Entered OTP: $enteredOTP');
// //                   }
// //                 },
// //                 child: const Text('Submit'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: OTPScreen(),
// //   ));
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';

// class OTPVerificationScreen extends StatefulWidget {
//   const OTPVerificationScreen({Key? key}) : super(key: key);

//   @override
//   _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
// }

// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//   final TextEditingController otpController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   late Timer _timer;
//   int _secondsRemaining = 60;
//   bool _resendButtonEnabled = false;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondsRemaining > 0) {
//           _secondsRemaining--;
//         } else {
//           _resendButtonEnabled = true;
//           _timer.cancel();
//         }
//       });
//     });
//   }

//   void resendOTP() {
//     // Implement logic to resend OTP
//     setState(() {
//       _secondsRemaining = 60;
//       _resendButtonEnabled = false;
//       startTimer();
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // OTP Input Fields
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //   children: List.generate(
//               //     4,
//               //     (index) => SizedBox(
//               //       width: 50.0,
//               //       child: TextFormField(
//               //         controller: otpController,
//               //         keyboardType: TextInputType.number,
//               //         textAlign: TextAlign.center,
//               //         maxLength: 1,
//               //         decoration: InputDecoration(
//               //           enabledBorder: OutlineInputBorder(
//               //             borderRadius: BorderRadius.circular(11),
//               //             borderSide: const BorderSide(
//               //               color: Color.fromARGB(255, 213, 195, 195),
//               //             ),
//               //           ),
//               //           filled: true,
//               //           fillColor: const Color.fromARGB(255, 245, 234, 234),
//               //           contentPadding: const EdgeInsets.all(0),
//               //           counterText: '',
//               //           border: OutlineInputBorder(
//               //             borderRadius: BorderRadius.circular(11),
//               //           ),
//               //         ),
//               //         validator: (value) {
//               //           if (value == null || value.isEmpty) {
//               //             return 'Please enter a digit';
//               //           }
//               //           if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//               //             return 'Please enter only numeric digits';
//               //           }
//               //           return null;
//               //         },
//               //         onChanged: (value) {
//               //           if (value.length == 1 && index < 3) {
//               //             FocusScope.of(context).nextFocus();
//               //           } else if (value.length == 0 && index > 0) {
//               //             FocusScope.of(context).previousFocus();
//               //           }
//               //         },
//               //       ),
//               //     ),
//               //   ),
//               // ),

//               // Validation Message
//               // if (_formKey.currentState?.validate() ?? false)
//               //   Text(
//               //     'Please correct the errors above',
//               //     style: TextStyle(color: Colors.red),
//               //   ),

//               // Resend Button and Timer
//               if (_resendButtonEnabled)
//                 ElevatedButton(
//                   onPressed: () => resendOTP(),
//                   child: const Text('Resend OTP'),
//                 )
//               else
//                 Text(
//                   'Resend OTP in $_secondsRemaining seconds',
//                   style: TextStyle(color: Colors.grey),
//                 ),

//               // Submit Button
//               SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Your validation was successful, perform further actions
//                     // For example, check if the entered OTP is correct
//                     String enteredOTP = otpController.text;
//                     // Implement your OTP validation logic here
//                     print('Entered OTP: $enteredOTP');
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: OTPVerificationScreen(),
//   ));
// }

import 'package:flutter/material.dart';

void main() {
  runApp(dddd());
}

class dddd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OTP Text Field Example'),
        ),
        body: Center(
          child: MyOtpTextField(),
        ),
      ),
    );
  }
}

class MyOtpTextField extends StatefulWidget {
  @override
  _MyOtpTextFieldState createState() => _MyOtpTextFieldState();
}

class _MyOtpTextFieldState extends State<MyOtpTextField> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => Container(
            width: 50.0,
            height: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counter: Offstage(),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
