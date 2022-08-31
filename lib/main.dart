import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';
import './movie_list_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: MovieListPage(),
      ),
    );
  }
}
