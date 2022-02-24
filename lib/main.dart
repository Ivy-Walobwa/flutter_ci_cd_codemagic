import 'package:flutter/material.dart';
import 'presentation/author_list_screen.dart';
import 'utils/author_service.dart';

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
      title: 'Flutter CI/CD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AuthorListScreen(authorService: AuthorService.instance,),
    );
  }
}

