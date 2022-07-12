import 'package:api_app/homepage_post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HTTP GET',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomepagePost(),
    );
  }
}
