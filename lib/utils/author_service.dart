import 'dart:convert';

import 'package:http/http.dart';
import '../models/author.dart';

class AuthorService{
  static final AuthorService _singleton =  AuthorService._internal();
  AuthorService._internal();
  static AuthorService get instance => _singleton;

  final _baseURL = "https://quotable.io";

  Future<List<Author>> getAuthors(Client client)async{
    const authorsEndpoint = '/authors';

    Response res = await client.get(Uri.parse(_baseURL + authorsEndpoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> authorsJson= body['results'];

      List<Author> authors = authorsJson.map((json)=> Author.fromJson(json)).toList();
      return authors;
    } else {
      throw Exception("Unable to retrieve authors");
    }
  }
}