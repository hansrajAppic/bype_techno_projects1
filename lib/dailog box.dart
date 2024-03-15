// import 'package:flutter/material.dart';

// void main() {
//   runApp(app());
// }

// class app extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _isLoading = false;
//   bool _isLoadings = false;

//   void _showLoadingDialog() {
//     setState(() {
//       _isLoading = true;
//     });

//     // Simulate a time-consuming task
//     Future.delayed(Duration(seconds: 3), () {
//       setState(() {
//         _isLoading = false;
//       });
//       _showAlertDialog();
//     });
//   }

//   void _showAlertDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Task Complete'),
//           content: Text('The task has been completed.'),
//           actions: <Widget>[
//             TextButton(
//               child: _isLoadings
//                   ? CircularProgressIndicator(
//                       color: Colors.black,
//                     )
//                   : Text('OK'),
//               onPressed: () {
//                 setState(() {
//                   _isLoadings = true;
//                 });
//                 Future.delayed(Duration(seconds: 5), () {
//                   setState(() {
//                     _isLoadings = false;
//                   });
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circular Progress Indicator Example'),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: _isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _showLoadingDialog,
//                     child: Text('Start Task'),
//                   ),
//           ),
//           InkWell(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Task Complete'),
//                       content: Text('The task has been completed.'),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text('OK'),
//                           onPressed: () {},
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text("data")),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CircularProgress in AlertDialog',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Loading...'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 10),
              Text('Please wait...'),
            ],
          ),
        );
      },
    );
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CircularProgress in AlertDialog'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Loading...'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              // child: CircularProgressIndicator(),
                              child: TextButton(
                                  onPressed: () {}, child: Text("data"))),
                          SizedBox(height: 10),
                          Text('Please wait...'),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("data")),
          SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                showCircularProgressIndicator(context);
              },
              child: Text("app")),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showProgressDialog(context);
              },
              child: Text('Show ProgressDialog'),
            ),
          ),
        ],
      ),
    );
  }

  void showCircularProgressIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing dialog on outside tap
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 20,
            width: 30,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );

    // Simulate a delay of 3 seconds (for example purposes)
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close the dialog after 3 seconds
    });
  }
}
