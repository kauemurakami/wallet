import 'package:deebxwallet/app/data/service/wallet_address.dart';
import 'package:deebxwallet/app/modules/home/binding.dart';
import 'package:deebxwallet/app/modules/home/page.dart';
import 'package:deebxwallet/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await Get.putAsync(() => WalletAddressService().init());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    initialBinding: HomeBinding(),
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
  ));
}
