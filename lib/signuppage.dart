import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo2/nextpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Declare variables to hold form data
  final _formKey = GlobalKey<FormState>();
  final _dobController = TextEditingController();
  String _name = '';
  String _phoneNumber = '';
  int _age = 0;
  String _gender = 'Select Gender'; // Set default value to Select Gender
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      _dobController.text = selectedDate.toString().substring(0, 10);
    }
  }

  saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = {};
    List<Map<String, dynamic>> userList = [];
    user["name"] = _name;
    user["phoneNumber"] = _phoneNumber;
    user["age"] = _age;
    print("map user $user");
    print(" encoding the user data ${jsonEncode(user)}");
    userList.add(user);
    print("printing user data list $userList");
    prefs.setString("listUsers", jsonEncode(userList));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator:
                      RequiredValidator(errorText: 'Full name is required'),
                  onSaved: (val) => setState(() => _name = val!),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator:
                      RequiredValidator(errorText: 'Phone number is required'),
                  onSaved: (val) => setState(() => _phoneNumber = val!),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  onTap: () => _showDatePicker(context),
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator:
                      RequiredValidator(errorText: 'Date of Birth is required'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: RequiredValidator(errorText: 'Age is required'),
                  onSaved: (val) => setState(() => _age = int.parse(val!)),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Gender'),
                  value: _gender,
                  items: <String>['Select Gender', 'Male', 'Female', 'Others']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: RequiredValidator(errorText: 'Gender is required'),
                  onChanged: (val) => setState(() => _gender = val!),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email is required'),
                  ]),
                  onSaved: (val) => setState(() => _email = val!),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Password is required'),
                    MinLengthValidator(8,
                        errorText:
                            'Password must be at least 8 characters long'),
                  ]),
                  onSaved: (val) => setState(() => _password = val!),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  onSaved: (val) => setState(() {
                    print(val);
                    print(_password);
                    print(_confirmPassword);

                    _confirmPassword = val!;
                  }),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      // Validate form data
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Do something with the form data
                        print('Full Name: $_name');
                        print('Phone Number: $_phoneNumber');
                        print('Age: $_age');
                        print('dob: $_dobController');
                        print('Gender: $_gender');
                        print('Email: $_email');
                        print('Password: $_password');
                        print('Confirm Password: $_confirmPassword');
                        saveUser();

                        // Clear form data
                        _formKey.currentState!.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => NewPage(
                                  name: 'new page',
                                )),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
