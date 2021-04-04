import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' show json;
import "package:http/http.dart" as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  clientId:
      '1086905123562-i4qsn9fn12lh2nq0jn1vvcc99ras4k45.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class ProfilePage extends StatefulWidget {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        widget._currentUser = account;
      });
      if (widget._currentUser != null) {
        _handleGetContact(widget._currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Center(
          child: Text("Account"),
        ),
        actions: [getActionLogOut()],
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
                    widget._contactText,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _handleSignIn();
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

  Widget getActionLogOut() {
    return InkWell(
      onTap: () {
        if (widget._currentUser != null) {
          _handleSignOut();
        }
      },
      child: Container(
        padding: EdgeInsets.only(right: 16, left: 8),
        child: Icon(
          Icons.logout,
          color:
              widget._currentUser != null ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Future<void> _handleGetContact(GoogleSignInAccount? user) async {
    setState(() {
      widget._contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user?.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        widget._contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        widget._contactText = "I see you know $namedContact!";
      } else {
        widget._contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic>? data) {
    final List<dynamic>? connections = data?['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }
}
