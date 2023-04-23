import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(
          text: "Trending Movies",
          size: 26,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 270.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: trending[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      trending[index]["backdrop_path"],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      trending[index]["poster_path"],
                                  description: trending[index]["overview"],
                                  vote: trending[index]['vote_average'].toString(),
                                  launch_on:trending[index]['release_date'] ,
                                )));
                  },
                  child: Container(
                    width: 140.0,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500" +
                                trending[index]["poster_path"],
                          ))),
                        ),
                        Container(
                          child: ModifiedText(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'loading',
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
