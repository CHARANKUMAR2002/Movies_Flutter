import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;

class getTorrent extends StatefulWidget {
  var name;
  getTorrent({required this.name});
  @override
  _getTorrentState createState() => _getTorrentState();
}

class _getTorrentState extends State<getTorrent> {
  var torrent;
  String url =
      "https://easytorrents1.p.rapidapi.com/?type=movie&name=Cars&language=en&quality=1080p";
  String api_host = "easytorrents1.p.rapidapi.com";

  Future<void> req(var name, var quality, var key) async {
    Response apiReq = await get(
      Uri.parse(
          "https://easytorrents1.p.rapidapi.com/?type=movie&name=$name&language=en&quality=$quality"),
      headers: {'x-rapidapi-host': api_host, 'x-rapidapi-key': key},
    );
    var result = json.decode(apiReq.body);
    torrent = result['magnet_link'];
    if (await canLaunch(torrent.toString())) {
      await launch(torrent);
    } else {
      toast.Fluttertoast.showToast(msg: "Something Went Wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: RaisedButton.icon(
            onPressed: () {
              final api_key = [
                "ed8aaedc7cmshf3c6a200313ac82p123172jsn50e430bde585",
                "8e7739d2d3mshb0396214a5bfb06p1f4a73jsn949275f510f3",
                "dd6df9d965msh2a90f6a63 8ba34ep1fc874jsn8762ab33ec8f",
              ];
              final key = (api_key..shuffle()).first.toString();
              req(widget.name, '720p', key);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.green,
            label: Text(
              "720p",
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: RaisedButton.icon(
            onPressed: () {
              final api_key = [
                "ed8aaedc7cmshf3c6a200313ac82p123172jsn50e430bde585",
                "8e7739d2d3mshb0396214a5bfb06p1f4a73jsn949275f510f3",
                "dd6df9d965msh2a90f6a63 8ba34ep1fc874jsn8762ab33ec8f",
              ];
              final key = (api_key..shuffle()).first.toString();
              req(widget.name, '1080p', key);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.blue.shade700,
            label: Text(
              "1080p",
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
