import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/get_episodes.dart';
import 'package:movie_app/get_seasons.dart';
import 'package:movie_app/get_tv_cast.dart';
import 'package:movie_app/get_tv_genre.dart';
import 'package:movie_app/loading.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TVShows extends StatefulWidget {
  const TVShows({required this.tv});
  final List tv;
  @override
  _TVShowsState createState() => _TVShowsState();
}

class _TVShowsState extends State<TVShows> {
  @override
  ScrollController scroll = ScrollController();
  @override
  void initState() {
    super.initState();
    sc.add(widget.tv);
    stream = sc.stream;
  }

  StreamController sc = StreamController();
  late Stream stream;
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
    return StreamBuilder(
        stream: stream,
        builder: (context, snapShot) {
          if (snapShot.data.toString() == "[]") {
            return Loading();
          }
          else {
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
                      "TV Shows",
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.tv.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: ClipRRect(
                          child: GestureDetector(
                            onTap: () {
                              @override
                              void initState() {
                                super.initState();
                                getGenre(
                                  id: widget.tv[index]['id'],
                                );
                              }

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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    child: widget.tv[index][
                                                                'backdrop_path'] !=
                                                            null
                                                        ? ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            20)),
                                                            child: Image.network(
                                                                "https://image.tmdb.org/t/p/w500" +
                                                                    widget.tv[
                                                                            index]
                                                                        [
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
                                                              child:
                                                                  Image.network(
                                                                "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    height: 238,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: Colors.black
                                                            .withOpacity(.5)),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        widget.tv[index]
                                                                    ['name'] !=
                                                                null
                                                            ? Text(
                                                                "${widget.tv[index]['name']} \t\t",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic),
                                                              )
                                                            : Text(
                                                                "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white,
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
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        widget.tv[index][
                                                                    'vote_average'] !=
                                                                0
                                                            ? Text(
                                                                "Ratings : " +
                                                                    widget
                                                                        .tv[index]
                                                                            [
                                                                            'vote_average']
                                                                        .toString() +
                                                                    " ⭐",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white,
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
                                              Container(
                                                  child: getGenre(
                                                      id: widget.tv[index]
                                                          ['id'])),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  alignment: Alignment.topLeft,
                                                  child: widget.tv[index][
                                                              'first_air_date'] !=
                                                          null
                                                      ? Text(
                                                          "First On Air : " +
                                                              widget.tv[index][
                                                                      'first_air_date']
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        )
                                                      : Text(
                                                          "First On Air : Unknown",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        )),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Seasons & Episodes",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic),
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
                                                            id: widget.tv[index]
                                                                ['id']),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        getEpisodes(
                                                            id: widget.tv[index]
                                                                ['id']),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 40,
                                                        ),
                                                        child: widget.tv[index][
                                                                    'poster_path'] !=
                                                                null
                                                            ? Container(
                                                                height: 150,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            50,
                                                                        vertical:
                                                                            50),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                                                                            widget.tv[index]['poster_path']))),
                                                              )
                                                            : Container(
                                                                height: 100,
                                                                child: Image
                                                                    .network(
                                                                  "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                      ),
                                                      Flexible(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            20),
                                                                child: widget.tv[index]
                                                                            [
                                                                            'overview'] !=
                                                                        null
                                                                    ? Text(
                                                                        widget.tv[index]
                                                                            [
                                                                            'overview'],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white,
                                                                            fontStyle: FontStyle.italic),
                                                                        textAlign:
                                                                            TextAlign.justify,
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
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  getTvCast(
                                                      id: widget.tv[index]
                                                          ['id']),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
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
                                  widget.tv[index]['poster_path'] != null
                                      ? Container(
                                          height: 200,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://image.tmdb.org/t/p/w500" +
                                                          widget.tv[index][
                                                              'poster_path']))),
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
                                  widget.tv[index]['name'] != null
                                      ? Text(
                                          "${widget.tv[index]['name']} \t\t",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic),
                                        )
                                      : Text(
                                          "",
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
                SizedBox(
                  height: 20,
                )
              ],
            ));
          }
        });
  }
}
