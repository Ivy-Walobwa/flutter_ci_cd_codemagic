import 'package:flutter/material.dart';
import 'presentation/author_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI/CD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthorListScreen(),
    );
  }
}

