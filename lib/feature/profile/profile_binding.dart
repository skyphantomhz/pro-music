import 'package:get/get.dart';
import 'package:pro_music/feature/profile/link_account_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkAccountController());
  }
}
