import 'package:get/get.dart';
import 'package:pro_music/feature/homepage/home_page.dart';
import 'package:pro_music/feature/profile/profile_binding.dart';
import 'package:pro_music/feature/profile/profile_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    )
  ];
}
