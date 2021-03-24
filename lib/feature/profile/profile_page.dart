import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Center(
          child: Text("Account"),
        ),
        actions: [Icon(Icons.logout)],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              margin: EdgeInsets.only(top: 32),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 50,
                    backgroundColor: Colors.blue,
                    foregroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/funny-cartoon-monster-face-wearing-eyeglasses-vector-halloween-monster-square-avatar-funny-cartoon-monster-face-vector-monster-175919533.jpg",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Your name",
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                final x = 4;
              },
              child: ListTile(
                leading: Icon(Icons.link),
                title: Text("Link to youtube account"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
