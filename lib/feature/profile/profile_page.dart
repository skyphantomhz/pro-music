import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_music/feature/profile/link_account_controller.dart';

class ProfilePage extends StatelessWidget {
  LinkAccountController linkAccount() =>
      GetInstance().find<LinkAccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Center(
          child: Text("Account"),
        ),
        actions: [getActionLogOut(context)],
      ),
      body: SafeArea(
        child: linkAccount().obx(
          (user) {
            if (user != null) {
              return ListView(
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
                            user.photoURL ?? "",
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          user.displayName ?? "Your name",
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                child: InkWell(
                  onTap: () {
                    _handleSignIn(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: Text("Link to youtube account"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            }
          },
          onLoading: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget getActionLogOut(BuildContext context) {
    return linkAccount().obx(
      (user) {
        if (user != null) {
          return InkWell(
            onTap: () {
              _handleSignOut(context);
            },
            child: Container(
              padding: EdgeInsets.only(right: 16, left: 8),
              child: Icon(Icons.logout, color: Colors.white),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.only(right: 16, left: 8),
            child: Icon(Icons.logout, color: Colors.transparent),
          );
        }
      },
      onLoading: CircularProgressIndicator(),
    );
  }

  void _handleSignIn(BuildContext context) async {
    linkAccount().register(context);
  }

  void _handleSignOut(BuildContext context) =>
      linkAccount().unregister(context);
}
