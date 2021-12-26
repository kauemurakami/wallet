import 'package:deebxwallet/app/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.addWallet(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('HomePage')),
        body: const SafeArea(child: Text('HomeController')));
  }
}
