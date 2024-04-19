import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/global_color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.idController,
                style: TextStyle(color: GlobalColor.soft, fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Rent Code",
                  hintStyle: const TextStyle(color: Colors.black38, fontSize: 20),
                  prefixIcon: Icon(
                    Icons.numbers,
                    color: GlobalColor.softDeep,
                  ),
                  filled: true,
                  fillColor: Colors.black12,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => controller.search(),
                label: const Text("Search",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                icon: const Icon(Icons.search, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(25.0),
                  backgroundColor: GlobalColor.softDeep,
                  elevation: 5,
                  shape: const StadiumBorder(),
                ),
              )
            ],
          ),
        ));
  }
}
