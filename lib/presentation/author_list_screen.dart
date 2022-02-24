import 'package:flutter/material.dart';
import '../constants.dart';
import 'author_detail_screen.dart';
import '../models/author.dart';
import '../utils/author_service.dart';
import 'package:http/http.dart' as http;

class AuthorListScreen extends StatefulWidget {
  final AuthorService authorService;

  const AuthorListScreen({Key? key, required this.authorService}) : super(key: key);

  @override
  State<AuthorListScreen> createState() => _AuthorListScreenState();
}

class _AuthorListScreenState extends State<AuthorListScreen> {
  late final Future<List<Author>> futureAuthorsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: FutureBuilder<List<Author>>(
        future: futureAuthorsList,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final authors = snapshot.data!;
            return ListView.builder(
              key: kAuthorListKey,
              itemBuilder: (ctx, index) => ListTile(
                key: Key(authors[index].id),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  AuthorDetailScreen(author: authors[index],)),
                  );
                },
                title: Text(authors[index].name),
                subtitle: Text(authors[index].description),
              ),
              itemCount: authors.length,
            );
          }
          if(snapshot.hasError){
            return Center(
              key: kErrorKey,
              child: Text(snapshot.error.toString()),);
          }
          return const Center(child: CircularProgressIndicator(),);

        }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureAuthorsList =widget.authorService.getAuthors(http.Client());
  }
}
