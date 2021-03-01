import 'dart:ui';
import 'package:flutter/material.dart';import 'package:futsu/main.dart';
import 'package:futsu/screens/menu.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  RootPageState createState() => RootPageState();
}




class RootPageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC14949),
        bottom: PreferredSize(
            preferredSize: Size(0, 35),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.dehaze,
                    color: Color(0xFFFFFFFF),
                  ),
                  onPressed: () {
                    print(context);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MenuState();
                        },
                        fullscreenDialog: true));
                  },
                ),
                Flexible(
                  child: TextField(
                    onChanged: (text) {
                      print(text);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Center(
                  child: ElevatedButton(
                    child: Text('button'),
                    onPressed: () async {
                      var url = 'http://localhost:8000/api/app';
                      var response = await http.get(url);
                      print(response.body);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFFC14949)),
                    ),)
              ),
              DrawerController(child: Text('test'), alignment: DrawerAlignment.end)
            ],
          )
      ),
    );
  }
}