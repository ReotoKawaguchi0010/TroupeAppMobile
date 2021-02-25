import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

const locale = Locale("ja", "JP");
const localeEn = Locale("en", "EN");

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Demo';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      locale: locale,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
        localeEn,
      ],
      home: MyHomePage(title: appTitle,)
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  @override
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
                    print('test');
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
            ],
          )
      ),
      drawer: Drawer(),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
