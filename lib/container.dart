
import 'package:flutter/material.dart';

class aood extends StatefulWidget {
  const aood({super.key});

  @override
  State<aood> createState() => _ApState();
}

class _ApState extends State<aood> {
  bool check = false;
  void printmasge() {
    print("user accepet aggrement");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: check,
          onChanged: (bool? val) {
            setState(() {
              check = val!;
            });
          }),
      Text(
        "Remember me ",
        style: TextStyle(fontSize: 14, color: Color.fromRGBO(119, 105, 105, 1)),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: MaterialButton(
          onPressed: check ? printmasge : null,
          child: Text(
            "Logain",
          ),
          textColor: Colors.green,
          color: Colors.blue,
        ),
      ),
      ListTile(
        leading: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            value: check,
            onChanged: (bool? val) {
              setState(() {
                check = val!;
              });
            }),
        title: Text(
          "Remember me ",
          style:
              TextStyle(fontSize: 14, color: Color.fromRGBO(119, 105, 105, 1)),
        ),
        trailing: Container(
          margin: EdgeInsets.only(top: 10),
          child: MaterialButton(
            onPressed: check ? printmasge : null,
            child: Text(
              "Logain",
            ),
            textColor: Colors.green,
            color: Colors.blue,
          ),
        ),
      )
    ]));
  }
}
