import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

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
              padding: EdgeInsets.only(left: 16, right: 16),
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
            )
          ],
        ),
      ),
    );
  }
}
