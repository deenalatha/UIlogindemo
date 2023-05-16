import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPage extends StatefulWidget {
  final String name;

  NewPage({Key? key, required this.name}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int counter = 0;
  String? name;
  String? phone;

  void saveUser() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an integer value to 'counter' key.
    await prefs.setInt('counter', counter);

    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final int? counterValue = prefs.getInt('listUsers');

    print("shared data $counterValue");
  }

  void getSafedUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? data = prefs.getString('listUsers');

//     //step 1
//     // we have data must be in string json format
// // to store proceesed data in requird data type
//     List<Map<String, dynamic>> dataList = [];

//     List<dynamic> jsonData = jsonDecode(data.toString());
//     jsonData.forEach((item) {
//       print(item);
//       dataList.add(Map<String, dynamic>.from(item));
//     });

//     print(dataList);

//     Map<String, dynamic> result = {};

//     for (var item in jsonData) {
//       String name = item['name'];
//       int phoneNumber = item['phoneNumber'];
//       int age = item['age'];

//       print(name);
//       print(phoneNumber);
//       print(age);
//     }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('listUsers');
    print("getting data from phone $data");
    var dataList = [];
    Map<String, dynamic> user = {};
    if (data != null) {
      var jsonData = jsonDecode(data);
      jsonData.forEach((item) {
        user["name"] = item['name'];
        user['phoneNumber'] = item['phoneNumber'];
        user['age'] = item['age'];
        dataList.add(user);
      });
      // for (var item in jsonData) {
      //   print(item);
      //   print(item.runtimeType);
      //   print(item['name']);
      // }
      // print(jsonData.runtimeType);
      // print(jsonData);
      // print(dataList[0]['name']);
      // print(dataList);
      // name = dataList[0]['name'];
      // phone = dataList[0]['phoneNumber'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome  ${widget.name}'),
      ),
      body: Column(
        children: [
          name == null ? Text("waiting") : Text(name!),
          name == null ? Text("waiting") : Text(phone!),
          Center(child: Text("hello")),
          ElevatedButton(
              onPressed: () {
                getSafedUser();
              },
              child: Text("get users"))
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("hello")),
          ElevatedButton(
              onPressed: () {
                // getSafedUser();
              },
              child: Text("get users"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
