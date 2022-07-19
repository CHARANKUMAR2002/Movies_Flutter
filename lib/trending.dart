import 'package:flutter/material.dart';
import 'package:movie_app/get_torrent.dart';
import 'package:movie_app/get_trending_genre.dart';

import 'get_episodes.dart';
import 'get_movie_cast.dart';
import 'get_seasons.dart';
import 'get_tv_cast.dart';
import 'get_tv_genre.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({required this.trending});

  final List trending;

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  Widget makeDismiss({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
  ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Trending Now",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.trending.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: ClipRRect(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return makeDismiss(
                                child: DraggableScrollableSheet(
                                  initialChildSize: .5,
                                  maxChildSize: .965,
                                  builder: (_, controller) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: Colors.black,
                                    ),
                                    child: ListView(
                                      controller: controller,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              child: widget.trending[index]
                                                          ['backdrop_path'] !=
                                                      null
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20)),
                                                      child: Image.network(
                                                          "https://image.tmdb.org/t/p/w500" +
                                                              widget.trending[
                                                                      index][
                                                                  'backdrop_path']),
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20)),
                                                      child: Container(
                                                        height: 238,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1,
                                                        child: Image.network(
                                                          "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              height: 238,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                  color: Colors.black
                                                      .withOpacity(.5)),
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  widget.trending[index]
                                                              ['title'] !=
                                                          null
                                                      ? Text(
                                                          "${widget.trending[index]['title']} \t\t",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        )
                                                      : Text(
                                                          "${widget.trending[index]['name']} \t\t",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                  SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 200,
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  widget.trending[index][
                                                              'vote_average'] !=
                                                          0
                                                      ? Text(
                                                          "Ratings : " +
                                                              widget.trending[
                                                                      index][
                                                                      'vote_average']
                                                                  .toString() +
                                                              " ⭐",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        )
                                                      : Text(" ")
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        widget.trending[index]['title'] == null
                                            ? getGenre(
                                                id: widget.trending[index]
                                                    ['id'])
                                            : getMovieGenre(
                                                id: widget.trending[index]
                                                    ['id']),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            alignment: Alignment.topLeft,
                                            child: widget.trending[index]
                                                        ['release_date'] !=
                                                    null
                                                ? Text(
                                                    "Initial Release : " +
                                                        widget.trending[index]
                                                                ['release_date']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  )
                                                : Text(
                                                    "First On Air : " +
                                                        widget.trending[index][
                                                                'first_air_date']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        widget.trending[index]['title'] ==
                                                    null
                                                ? Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        child: Text(
                                                          "Seasons & Episodes",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        controller: scroll,
                                                        child: Column(
                                                          children: [
                                                            getSeasons(
                                                                id: widget.trending[
                                                                        index]
                                                                    ['id']),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            getEpisodes(
                                                                id: widget.trending[
                                                                        index]
                                                                    ['id']),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                                SizedBox(height: 30,),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                  ),
                                                  child: widget.trending[index]
                                                              ['poster_path'] !=
                                                          null
                                                      ? Container(
                                                          height: 150,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      50,
                                                                  vertical: 50),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "https://image.tmdb.org/t/p/w500" +
                                                                          widget.trending[index]
                                                                              [
                                                                              'poster_path']))),
                                                        )
                                                      : Container(
                                                          height: 100,
                                                          child: Image.network(
                                                            "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 20),
                                                          child: widget.trending[
                                                                          index]
                                                                      [
                                                                      'overview'] !=
                                                                  null
                                                              ? Text(
                                                                  widget.trending[
                                                                          index]
                                                                      [
                                                                      'overview'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                )
                                                              : Text("")),
                                                      SizedBox(
                                                        height: 30,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Casts',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                            widget.trending[index]['title'] !=
                                                    null
                                                ? getCast(
                                                    id: widget.trending[index]
                                                        ['id'])
                                                : getTvCast(
                                                    id: widget.trending[index]
                                                        ['id']),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            widget.trending[index]['title'] != null ?
                                        Column(
                                          children: [
                                            getTorrent(name: widget.trending[index]['title'],),
                                            SizedBox(height: 30,)
                                          ],
                                        ) : SizedBox()
                                      
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 200,
                        width: 135,
                        child: Column(
                          children: [
                            widget.trending[index]['poster_path'] != null
                                ? Container(
                                    height: 200,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500" +
                                                    widget.trending[index]
                                                        ['poster_path']))),
                                  )
                                : Container(
                                    height: 100,
                                    child: Image.network(
                                      "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            widget.trending[index]['title'] != null
                                ? Text(
                                    "${widget.trending[index]['title']} \t\t",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  )
                                : Text(
                                    "${widget.trending[index]['name']} \t\t",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
