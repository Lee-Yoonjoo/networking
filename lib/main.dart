import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
    home: MyHomePage(),

  ));
}


class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP & JSON Tutorial"),
      ),
    );
  }
}
