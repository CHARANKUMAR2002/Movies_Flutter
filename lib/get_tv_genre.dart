import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class getGenre extends StatefulWidget {
  final id;
  getGenre({required this.id});

  @override
  _getGenreState createState() => _getGenreState();
}

class _getGenreState extends State<getGenre> {
  List gen = [];
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
      gen = tvg['genres'];
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
              itemCount: gen.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(gen[index]['name'], style: TextStyle(
                                          fontSize: 15,color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                          )
                                          );
              },
          ),
    );
  }
}
