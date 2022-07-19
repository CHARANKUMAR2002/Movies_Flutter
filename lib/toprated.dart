import 'package:flutter/material.dart';
import 'package:movie_app/get_torrent.dart';

import 'get_movie_cast.dart';
import 'get_trending_genre.dart';
import 'get_tv_cast.dart';

class TopRated extends StatefulWidget {
  final List top;

  const TopRated({required this.top});

  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  Widget makeDismiss({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Top Rated Movies",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.top.length,
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
                                              child: widget.top[index]
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
                                                              widget.top[index][
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
                                                  widget.top[index]['title'] !=
                                                          null
                                                      ? Text(
                                                          "${widget.top[index]['title']} \t\t",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        )
                                                      : Text(
                                                          " ",
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
                                                  widget.top[index][
                                                              'vote_average'] !=
                                                          0
                                                      ? Text(
                                                          "Ratings : " +
                                                              widget.top[index][
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
                                        getMovieGenre(
                                            id: widget.top[index]['id']),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            alignment: Alignment.topLeft,
                                            child: widget.top[index]
                                                        ['release_date'] !=
                                                    ""
                                                ? Text(
                                                    "Initial Release : " +
                                                        widget.top[index]
                                                                ['release_date']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  )
                                                : Text(
                                                    "Initial Release : Unknown",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                  ),
                                                  child: widget.top[index]
                                                              ['poster_path'] !=
                                                          null
                                                      ? Container(
                                                          height: 150,
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 50,
                                                                  vertical: 50),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(10),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "https://image.tmdb.org/t/p/w500" +
                                                                          widget.top[
                                                                                  index]
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
                                                          padding: EdgeInsets.only(
                                                              right: 20),
                                                          child: widget.top[index][
                                                                      'overview'] !=
                                                                  null
                                                              ? Text(
                                                                  widget.top[index]
                                                                      ['overview'],
                                                                  style: TextStyle(
                                                                      fontSize: 20,
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
                                                        height: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text('Casts', style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),),
                                                      getCast(
                                                          id: widget.top[index]
                                                              ['id']),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      getTorrent(name: widget.top[index]['title'],),
                                                      SizedBox(height: 30,)
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
                            widget.top[index]['poster_path'] != null
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
                                                    widget.top[index]
                                                        ['poster_path']))),
                                  )
                                : Container(
                                    height: 100,
                                    child: Image.network(
                                      "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            SizedBox(height: 10),
                            widget.top[index]['title'] != null
                                ? Text(
                                    "${widget.top[index]['title']} \t\t",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  )
                                : Text(
                                    " ",
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
