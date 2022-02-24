import 'package:flutter/material.dart';
import '../constants.dart';
import 'author_detail_screen.dart';
class AuthorListScreen extends StatelessWidget {
  const AuthorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: ListView.builder(
        key: kAuthorListKey,
        itemBuilder: (ctx, index) => ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AuthorDetailScreen()),
            );
          },
          title: Text('Name'),
          subtitle: Text('Description'),
        ),
        itemCount: 20,
      ),
    );
  }
}
