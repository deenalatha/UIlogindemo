import 'package:flutter/material.dart';
import 'package:demo2/signuppage.dart';

import 'homescreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String error = ' message';
  late String name;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontorller = TextEditingController();
  bool showpassword = false;

  void login() {
    if (namecontroller.text.trim() + "@gmail.com" == 'asdfghjk123@gmail.com') {
      if (passwordcontorller.text == 'lkjh098') {
        print("welcome");
        error = 'Welcome';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => NextPage(
              name: namecontroller.text,
            )),
          ),
        );
      } else {
        error = 'Invalid password';
      }
    } else {
      error = "Invalid Email";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Container(
        height: 800,
        width: 500,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordcontorller,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: !showpassword,
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: showpassword,
                    onChanged: (value) {
                      setState(() {
                        showpassword = value!;
                      });
                    },
                  ),
                  Text('Show Password'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: login,
                child: Text('Login'),
              ),
              SizedBox(height: 50.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => SignUpPage()),
                    ),
                  );
                },
                child: Text('Sign Up'),
              ),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
