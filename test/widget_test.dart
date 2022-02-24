import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_cicd_codemagic/constants.dart';
import 'package:flutter_cicd_codemagic/utils/author_service.dart';
import 'package:flutter_cicd_codemagic/models/author.dart';
import 'package:flutter_cicd_codemagic/presentation/author_list_screen.dart';

List<Author> _authorList = [
  Author(description: 'des1', name: 'name1', slug: 'aeschylus', id: 'id1'),
  Author(description: 'des2', name: 'name2', slug: 'alexander-pope', id: 'id2'),
];

class MockAuthorService extends Mock implements AuthorService {
  @override
  Future<List<Author>> getAuthors(code) async {
    return _authorList;
  }
}

void main() {
  late MockAuthorService mockAuthorService;
  late Widget authorListScreen;

  group('AuthorListScreen', () {
    setUp(() {
      HttpOverrides.global = null;
      mockAuthorService = MockAuthorService();

      authorListScreen = MaterialApp(
          home: AuthorListScreen(
        authorService: mockAuthorService,
      ));
    });

    testWidgets('starts with a loading spinner', (tester) async {
      await tester.pumpWidget(authorListScreen);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'loads and shows list of authors '
        'Tapping on first author shows detail screen with author description',
        (WidgetTester tester) async {

      final firstAuthor = _authorList[0];

      final authorListView = find.byKey(kAuthorListKey);
      final authorTile = find.byKey(Key(firstAuthor.id));
      final authorDetails = find.byKey(Key('detail${firstAuthor.id}'));

      await tester.pumpWidget(authorListScreen);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(authorListView, findsOneWidget);
      expect(authorTile, findsOneWidget);

      await tester.tap(authorTile);
      await tester.pumpAndSettle();

      expect(authorDetails, findsOneWidget);
    });
  });
}
