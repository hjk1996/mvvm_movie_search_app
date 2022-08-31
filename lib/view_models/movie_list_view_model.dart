import 'package:flutter/cupertino.dart';
import '../models/movie.dart';
import '../web_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = [];

  Future<void> fetchMovies(String keyword) async {
    final res = await WebService.fetchMovies(keyword);
    movies = res.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;
  MovieViewModel({required this.movie});

  String get title {
    return movie.title;
  }

  String get poster {
    return movie.poster;
  }
}
