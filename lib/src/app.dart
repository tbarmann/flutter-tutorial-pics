// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  var counter = 1;
  List<ImageModel> images = [];

  void fetchImage() async {
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState((){
      images.add(imageModel);
      counter++;
    });
  }

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Let\'s see some images!')
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
            child: Icon(Icons.add)
          ),
          body: ImageList(images)
        )  
      );
  }
}




