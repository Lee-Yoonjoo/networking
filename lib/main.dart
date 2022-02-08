import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//JSON, UTF-8 .. data converter for dart
import 'dart:convert';
//logging library
import 'dart:developer' as developer;

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
  //make page and limit dynamic
  int page = 1;
  int limit = 20;

  _fetchData() {
    String url = 'https://picsum.photos/v2/list?page=$page&limit=$limit';

    http.get(Uri.parse(url)).then((response) {
      String jsonString = response.body;

      if (response.statusCode == 200) {
        String jsonString = response.body;
        //check data on log
        developer.log('Check data from HTTP response $jsonString',name :'http.get' );

        List photos = jsonDecode(jsonString);
        for (int i = 0; i<photos.length; i++){
          var photo = photos[i];
          Photo eachPhoto = Photo(photo["id"], photo["author"]);

          developer.log('${eachPhoto.author}', name :'check photo data http.get' );
          setState(() {
            //Always on this method for update listview
            _data.add(eachPhoto);
            //get a new data from another page
            page++;
          });
        }

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
      body: GridView.builder(
      //  shrinkWrap: true,
       // physics: NeverScrollableScrollPhysics(),
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            Photo photo = _data[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 200.0,
              child: Card(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(

                        photo.author,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold,),
                      ),
                ),
                      //Only with Image it causes "A" RenderFlex overflowed by pixels"
                      Flexible(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://picsum.photos/id/${photo.id}/200/200',
                                ),
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                      ),
                    ],

                ),

              ),
            );
          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}


class Photo {
/*
  {
  "id": "1",
  "author": "Alejandro Escamilla",
  "width": 5616,
  "height": 3744,
  "url": "https://unsplash.com/photos/LNRyGwIJr5c",
  "download_url": "https://picsum.photos/id/1/5616/3744"
  }*/
  String id;
  String author;
  Photo(this.id, this.author);
}