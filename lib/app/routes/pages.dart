import 'package:deebxwallet/app/modules/home/binding.dart';
import 'package:deebxwallet/app/modules/home/page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding())
  ];
}
