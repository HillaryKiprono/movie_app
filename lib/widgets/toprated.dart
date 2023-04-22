import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(text: "Top Rated Movies", size: 26, color: Colors.white),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 270.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
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
                                toprated[index]["poster_path"],
                          ))),
                        ),
                        Container(
                          child: ModifiedText(
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
                                : 'loading',
                            color: Colors.white,
                            size: 16,
                          ),
                        )
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
