import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NextPage extends StatefulWidget {
  String name;
  NextPage({super.key, required this.name});

  @override
  State<NextPage> createState() => _NextPageState();

  substring(int i, int j) {}
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' welcome premganesh   ${widget.name}'),
      ),
      body: Center(
        child: Text('Welcome to the next page!'),
      ),
    );
    ;
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
