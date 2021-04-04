import 'package:flutter/material.dart';
import 'package:pro_music/data/fake.dart';
import 'package:pro_music/data/video.dart';
import 'package:pro_music/feature/homepage/player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;
  Video? videoSelected;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
              child: Row(children: [
                Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade400)),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 34,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: 'What are you looking for?'),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          widget.videoSelected = video;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  video.thumble,
                                ),
                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    color: Colors.black45,
                                    child: Text(
                                      video.duration,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 8),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(video.avatar),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          video.title,
                                          style: TextStyle(),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            video.publisher +
                                                " . " +
                                                video.views,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            getPlayerWidget()
          ],
        ),
      ),
    );
  }

  Widget getPlayerWidget() {
    if (widget.videoSelected != null) {
      return PlayerWidget(widget.videoSelected!);
    } else {
      return Container();
    }
  }
}
