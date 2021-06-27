import 'package:best_stories/APIs/EndPoints.dart';
import 'package:best_stories/ViewModel/GetStories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../response.dart';

// @GenerateMocks([http.Client])
void main() {
  group('fetch data', () {
    test('return done when succes', () async {
      final client = GetStoriesData();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(http.get(Uri.parse(APIs.getStories)))
          .thenAnswer((value) async => http.Response(response, 200));

      expect(await client.getStories(), isA<GetStoriesData>());
    });
  });
}
