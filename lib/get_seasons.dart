import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/get_episodes.dart';
import 'package:tmdb_api/tmdb_api.dart';

class getSeasons extends StatefulWidget {
  final id;
  getSeasons({required this.id});

  @override
  _getSeasonsState createState() => _getSeasonsState();
}

class _getSeasonsState extends State<getSeasons> {
  List season = [];
  final String apiKey = "80c32f3b41b54fb3b70a1f810a8184fa";
  final String apiAccessToken =
      "https://api.themoviedb.org/3/movie/550?api_key=80c32f3b41b54fb3b70a1f810a8184fa";

  Future<void> load() async {
    final tmdb = TMDB(
      ApiKeys(apiKey, apiAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map tvg = await tmdb.v3.tv.getDetails(widget.id);
    setState(() {
      season = tvg['seasons'];
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
    return Container(
      height: 20,
      child: ListView.builder(
              shrinkWrap: true,
              itemCount: season.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                     primary: Colors.white,
                     backgroundColor: Colors.transparent,
                     side: BorderSide(width: 1, color: Colors.white)),
                    onPressed: () {  },
                    child: Text(season[index]['season_number'].toString(), style: TextStyle(
                                            fontSize: 15,color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                            ),
                  )
                                          );
              },
          ),
    );
  }
}
