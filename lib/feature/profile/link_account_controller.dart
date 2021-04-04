import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_music/common/base_controler.dart';
import 'package:pro_music/utils/authentication.dart';

class LinkAccountController extends BaseController with StateMixin<User> {
  @override
  void onInit() {
    super.onInit();
    print("on Initial");
    _getCurrentAccount();
  }

  void unregister(BuildContext context) async {
    change(null, status: RxStatus.loading());
    await Authentication.signOut(context: context);
    _getCurrentAccount();
  }

  void register(BuildContext context) async {
    print("on Register");
    change(null, status: RxStatus.loading());
    await Authentication.signInWithGoogle(context: context);
    _getCurrentAccount();
  }

  void _getCurrentAccount() {
    User? user = FirebaseAuth.instance.currentUser;
    print("get current account: ${user?.displayName}");
    change(user, status: RxStatus.success());
  }
}
