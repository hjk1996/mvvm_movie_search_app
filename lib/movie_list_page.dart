import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_movie_app/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false)
        .fetchMovies('batman');
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    final mq = MediaQuery.of(context);
    AppBar appBar = AppBar(
      title: const Text('Movie App'),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height:
              mq.size.height - mq.viewInsets.top - appBar.preferredSize.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    vm.fetchMovies(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: vm.movies.length,
                  itemBuilder: (ctx, idx) {
                    final movie = vm.movies[idx];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: movie.poster == 'N/A'
                            ? const Icon(Icons.photo)
                            : Image.network(movie.poster),
                        title: Text(movie.title),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
