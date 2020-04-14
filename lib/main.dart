// import 'package:beta_card/Views/display_city_name_WidgetScreen.dart';
import 'package:beta_card/Views/display_country_name_WidgetScreen.dart';
// import 'package:beta_card/Views/display_monument_name.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ShowCountry(),
    );
  }
}
