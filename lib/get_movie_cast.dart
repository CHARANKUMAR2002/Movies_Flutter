import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/cast_loading.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:url_launcher/url_launcher.dart';

class getCast extends StatefulWidget {
  final id;
  getCast({required this.id});

  @override
  _getCastState createState() => _getCastState();
}

class _getCastState extends State<getCast> {
  List cast = [];
  bool isLoading = true;
  final String apiKey = "80c32f3b41b54fb3b70a1f810a8184fa";
  final String apiAccessToken =
      "https://api.themoviedb.org/3/movie/550?api_key=80c32f3b41b54fb3b70a1f810a8184fa";

  load() async {
    final tmdb = TMDB(
      ApiKeys(apiKey, apiAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map c = await tmdb.v3.movies.getCredits(widget.id);
    setState(() {
      cast = c['cast'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true ? CastLoading():
    Container(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      launch(
                          "https://www.google.com/search?q=${cast[index]['name']}");
                    },
                    child: Container(
                      height: 210,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 50),
                            decoration: cast[index]['profile_path'] != null
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500" +
                                                cast[index]['profile_path'])))
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://www.purdue.edu/gradschool/pulse/images/training-groups/nopic.jpg",
                                      ),
                                    ),
                                  ),
                          ),
                          Column(
                            children: [
                              cast[index]['name'] != null
                                  ? Text(
                                      cast[index]['name'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      'Unknown',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                              cast[index]['character'] != null
                                  ? Text(
                                      (" as \n") + cast[index]['character'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      'Unknown',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
