import 'package:flutter/material.dart';
import 'package:flutterblocstreamapp/screens/random_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example Bloc, Stream App",
      home: RandomListPage(),
    );
  }
}
