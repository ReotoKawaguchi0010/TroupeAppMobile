import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:futsu/screens/home.dart';



void main() {
  runApp(MyApp());
}

const locale = Locale("ja", "JP");
const localeEn = Locale("en", "EN");

final routes = [

];

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


class Routes {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Routes({this.name, this.route, this.builder});
}