import 'package:flutter/material.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'utils/text.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        color: Colors.green);
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedMovies = [];
  List tv = [];

  final String apiKey = '76072432101bd23b93e66e46f9364a64';

  final readAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NjA3MjQzMjEwMWJkMjNiOTNlNjZlNDZmOTM2NGE2NCIsInN1YiI6IjYzNzg4ZmM3MTU2Y2M3MDA4MjE4MmY0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9LyOBqxYnZhzNwIrcbqNRENjDZgvBUtYeUWg7Wlhkxs";

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));

    Map trendingResults = await tmdbwithCustomLogs.v3.trending.getTrending();

    Map topratedresults = await tmdbwithCustomLogs.v3.movies.getTopRated();

    Map tvresults = await tmdbwithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResults['results'];
      topratedMovies = topratedresults['results'];
      tv = tvresults['results'];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(
          text: "Flutter Movie Application ❤️",
          color: Colors.white,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
