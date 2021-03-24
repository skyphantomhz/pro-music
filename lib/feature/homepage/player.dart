import 'package:flutter/material.dart';
import 'package:pro_music/data/fake.dart';
import 'package:pro_music/data/video.dart';

class PlayerWidget extends StatefulWidget {
  final Video video;

  PlayerWidget(this.video);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.video.avatar),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.video.title,
                    maxLines: 1, softWrap: true, overflow: TextOverflow.clip),
                Text(
                  widget.video.publisher + " . " + widget.video.views,
                  maxLines: 1,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              final x = 3;
            },
            child: Container(
              child: Icon(Icons.play_arrow),
              padding: EdgeInsets.all(8),
            ),
          ),
          InkWell(
            onTap: () {
              final x = 3;
            },
            child: Container(
              child: Icon(Icons.skip_next),
              padding: EdgeInsets.all(8),
            ),
          )
        ],
      ),
    );
  }
}
