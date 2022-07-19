import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class getEpisodes extends StatefulWidget {
  final id;
  getEpisodes({required this.id});

  @override
  _getEpisodesState createState() => _getEpisodesState();
}

class _getEpisodesState extends State<getEpisodes> {
  List episodes = [];
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
      episodes = tvg['seasons'];
    });
  }

  @override
  void initState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ListView.builder(
              shrinkWrap: true,
              itemCount: episodes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OutlinedButton(
                    onPressed: (){},
                   style: OutlinedButton.styleFrom(
                     primary: Colors.white,
                     backgroundColor: Colors.transparent,
                     side: BorderSide(width: 1, color: Colors.white)
                     
                   ),
                    child: Text(episodes[index]['episode_count'].toString(), style: TextStyle(
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
