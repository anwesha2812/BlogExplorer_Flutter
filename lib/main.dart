import 'package:flutter/material.dart';
import 'package:subspace_blog_explorer/views/home.dart';
import 'package:subspace_blog_explorer/routes/route.dart' as route;

// import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get settings => null;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Colors.black,
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
      onGenerateRoute: route.controller,
    );
  }
}


