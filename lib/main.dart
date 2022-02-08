import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP & JSON Tutorial"),
      ),
      body: ListView.builder(
          itemCount: ,
          itemBuilder: (context, index){


      }),

    );
  }
}
