import 'package:flutter/material.dart';
import 'package:movie_app/get_tv_genre.dart';
import 'get_episodes.dart';
import 'get_movie_cast.dart';
import 'get_seasons.dart';
import 'get_torrent.dart';
import 'get_trending_genre.dart';
import 'get_tv_genre.dart';
import 'get_tv_cast.dart';

class result extends StatefulWidget {
  const result({required this.res});

  final List res;

  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
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
    ScrollController scroll = ScrollController();
    ScrollController _scroll = ScrollController();
    return Container(
      child: widget.res != null
          ? ListView.builder(
              controller: scroll,
              shrinkWrap: true,
              itemCount: widget.res.length,
              itemBuilder: (context, index) {
                return InkWell(
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
                                          child: widget.res[index]
                                                      ['backdrop_path'] !=
                                                  null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                  child: Image.network(
                                                      "https://image.tmdb.org/t/p/w500" +
                                                          widget.res[index][
                                                              'backdrop_path']),
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                  child: Container(
                                                    height: 238,
                                                    width:
                                                        MediaQuery.of(context)
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
                                                      top: Radius.circular(20)),
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              widget.res[index]['title'] != null
                                                  ? Text(
                                                      "${widget.res[index]['title']} \t\t",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )
                                                  : Text(
                                                      "${widget.res[index]['name']} \t\t",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic),
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
                                              widget.res[index]
                                                          ['vote_average'] !=
                                                      null
                                                  ? Text(
                                                      "Ratings : " +
                                                          widget.res[index][
                                                                  'vote_average']
                                                              .toString() +
                                                          " ⭐",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic),
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
                                    widget.res[index]['title'] == null
                                        ? getGenre(id: widget.res[index]['id'])
                                        : getMovieGenre(
                                            id: widget.res[index]['id']),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        alignment: Alignment.topLeft,
                                        child: widget.res[index]
                                                    ['release_date'] !=
                                                null
                                            ? Text(
                                                "Initial Release : " +
                                                    widget.res[index]
                                                            ['release_date']
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              )
                                            : widget.res[index]
                                                        ['first_air_date'] !=
                                                    null
                                                ? Text(
                                                    "First On Air : " +
                                                        widget.res[index][
                                                                'first_air_date']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  )
                                                : Text(" ")),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    widget.res[index]['title'] == null
                                        ? Column(
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
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
                                                controller: _scroll,
                                                child: Column(
                                                  children: [
                                                    getSeasons(
                                                        id: widget.res[index]
                                                            ['id']),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    getEpisodes(
                                                        id: widget.res[index]
                                                            ['id']),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
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
                                              child: widget.res[index]
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
                                                                      widget.res[
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
                                                      child: widget.res[index][
                                                                  'overview'] !=
                                                              null
                                                          ? Text(
                                                              widget.res[index]
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
                                                    height: 30,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        widget.res[index]['title'] != null
                                            ? Column(
                                                children: [
                                                  Text(
                                                    'Casts',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  getCast(
                                                      id: widget.res[index]
                                                          ['id']),
                                                ],
                                              )
                                            : getTvCast(
                                                id: widget.res[index]['id']),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        widget.res[index]['title'] != null ? 
                                        Column(
                                          children: [
                                            getTorrent(name: widget.res[index]['title'],),
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
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: widget.res[index]["title"] != null
                                      ? Text(
                                          widget.res[index]["title"],
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        )
                                      : Text(
                                          widget.res[index]["name"],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic),
                                        )),
                            ),
                            widget.res[index]['poster_path'] != null
                                ? Container(
                                    height: 150,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500" +
                                                    widget.res[index]
                                                        ['poster_path']))),
                                  )
                                : Container(
                                    height: 100,
                                    child: Image.network(
                                      "https://healthipe.utexas.edu/sites/default/files/styles/utexas_image_style_340w_227h/public/flex-content-areas/Poster%20Not%20Available_0.jpg?itok=RbscfV54",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: Text("No Results Found")),
    );
  }
}
