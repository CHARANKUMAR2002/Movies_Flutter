import 'package:flutter/material.dart';
import 'package:movie_app/loading.dart';

import 'toprated.dart';
import 'toptvshows.dart';
import 'trending.dart';
import 'search.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List trendingMovie = [];
  List topRated = [];
  List tvShow = [];
  bool isLoading = true;
  final String apiKey = "80c32f3b41b54fb3b70a1f810a8184fa";
  final String apiAccessToken =
      "https://api.themoviedb.org/3/movie/550?api_key=80c32f3b41b54fb3b70a1f810a8184fa";

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final tmdb = TMDB(
      ApiKeys(apiKey, apiAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingMovies = await tmdb.v3.trending.getTrending();
    Map topRatedMovies = await tmdb.v3.movies.getTopRated();
    Map tvShows = await tmdb.v3.tv.getPouplar();
    setState(() {
      trendingMovie = trendingMovies["results"];
      topRated = topRatedMovies["results"];
      tvShow = tvShows["results"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "M",
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
            Text("ovies",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => search()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => load(),
        child: isLoading == true ? ListView(
          children: [
            Loading(),
            Loading(),
            Loading()
          ],
        ):
        ListView(
          children: [
            TrendingMovies(trending: trendingMovie),
            TopRated(top: topRated),
            TVShows(tv: tvShow)
          ],
        ),
      ),
    );
  }
}
