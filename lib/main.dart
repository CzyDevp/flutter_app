import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/SecondActvity.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/ImageView.dart';
import 'package:flutter_app/ListOfWords.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List data;
  String apiUrl = 'https://randomuser.me/api/?results=15';
  //to make http request and get result as Json
  Future<void>makeRequest() async{
    var response = await http.get(
    Uri.encodeFull(apiUrl),
    headers: {'Accept': 'application/json'});
    this.setState((){
      var extractData = jsonDecode(response.body);  //JSON Deprecated
      data = extractData["results"];
    });
  }
  @override
  void initState(){
       super.initState();
       this.makeRequest();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Contact List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
             // _select(choices[0]);
              Navigator.push(context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new ListOfWords()),
              );
            },
          ),
        ],
      ),
      body: new ListView.builder(
        //padding: const EdgeInsets.all(16.0),
        itemCount: data==null? 0: data.length,
        itemBuilder: (BuildContext context,i){
          return new Container(
            decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 4.0, color: Colors.deepPurple),
              ),
              ),
            child : new ListTile(
            title: new Text(data[i]["name"]["first"]),
            subtitle: new Text(data[i]["phone"]),
            leading: new CircleAvatar(backgroundImage: new NetworkImage(data[i]["picture"]["thumbnail"]),
            ),
            onTap: (){
              Navigator.push(context,
                  new MaterialPageRoute(
                      builder: (BuildContext context)=> new SecondPage(data[i]) ),
              );
            },
          ),

          );
        },
      ),
       floatingActionButton: new FloatingActionButton(
           onPressed: (){
                         Navigator.push(context,
                                        new MaterialPageRoute(
                                        builder: (BuildContext context) => new ImageView()),
       );
       },
       child: new Icon(Icons.camera_alt),
      ),
    );
  }
}

