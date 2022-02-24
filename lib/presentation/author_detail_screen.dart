import 'package:flutter/material.dart';
import '../models/author.dart';

class AuthorDetailScreen extends StatelessWidget {
  final Author author;
  const AuthorDetailScreen({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Author Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.quotable.dev/profile/400/${author.slug}.jpg"),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    author.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Text(author.description,
                    style: Theme.of(context).textTheme.headline5),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
