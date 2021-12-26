import 'package:deebxwallet/app/data/provider/api/api.dart';
import 'package:deebxwallet/app/modules/home/controller.dart';
import 'package:deebxwallet/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository(MyApi())));
  }
}
