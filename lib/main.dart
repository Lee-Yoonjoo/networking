import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _data = [];

  _fetchData() {

    //make page and limit dynamic
    int page = 1;
    int limit = 20;
    String url = 'https://picsum.photos/v2/list?page=$page&limit=$limit';

    http.get(Uri.parse(url)).then((response) {
      String jsonString = response.body;

      if (response.statusCode == 200) {
        String jsonString = response.body;
        print(jsonString);
      } else {
        print('Error!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP & JSON Tutorial"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _fetchData();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(child: Text("")),
            );
          }),
    );
  }
}