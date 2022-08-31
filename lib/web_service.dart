import 'dart:convert';

import 'package:http/http.dart' as http;
import './models/movie.dart';
import './api.dart';

class WebService {
  static Future<List<Movie>> fetchMovies(String keyword) async {
    final url = '${API}&s=${keyword}';
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      final Iterable json = body['Search'];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}
