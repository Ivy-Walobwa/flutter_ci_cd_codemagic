import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'author_service_test.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_cicd_codemagic/utils/author_service.dart';
import 'package:flutter_cicd_codemagic/models/author.dart';

@GenerateMocks([http.Client])
void main() {
  late AuthorService sut;
  late MockClient client;

  setUp(() {
    sut = AuthorService.instance;
    client = MockClient();
  });

  group('getAuthors', () {

    test('returns list of Authors if the http call completes successfully',
            () async {
          when(client.get(Uri.parse('https://quotable.io/authors')))
              .thenAnswer((_) async => http.Response(
            '{"count": 20,"totalCount": 700,"page": 1,"totalPages": 35,"lastItemIndex": 20,"results": [{"link": "link","bio": "bio.","description": "British author","_id": "id","name": "name","quoteCount": 2,"slug": "slug","dateAdded": "2019-08-08","dateModified": "2019-08-08"}]}',
            200,
          ));
          expect(await sut.getAuthors(client), isA<List<Author>>());
        });

    test('throws an exception if the http call completes with an error', () {
      when(client.get(Uri.parse('https://quotable.io/authors')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(sut.getAuthors(client), throwsException);
    });
  });
}