import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/search_result.dart';
import 'package:tmdb_api/tmdb_api.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  var q;
  List genere = [];
  ScrollController scroll = ScrollController();

  final String apiKey = "80c32f3b41b54fb3b70a1f810a8184fa";
  final String apiAccessToken =
      "https://api.themoviedb.org/3/movie/550?api_key=80c32f3b41b54fb3b70a1f810a8184fa";
  Future <void>load(var query) async {
    final tmdb = TMDB(
      ApiKeys(apiKey, apiAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map gen = await tmdb.v3.search.queryMulti(q);
    setState(() {
      genere = gen['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load(q);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => load(q),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    IconButton(icon: Icon(CupertinoIcons.back), onPressed: () => Navigator.pop(context)),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .05),
                        child: CupertinoTextField(
                          autofocus: true,
                          placeholder: "Search Movies (or) Tv Shows",
                          onChanged: (value) {
                            setState(() {
                              q = value;
                              load(q);
                            });
                          },
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.withOpacity(.8))),
                        ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: genere != null
                      ? ListView(
                          controller: scroll,
                          shrinkWrap: true,
                          children: [result(res: genere)],
                        )
                      : Center(
                          child: Container(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
