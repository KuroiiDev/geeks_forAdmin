import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rent_detail_controller.dart';

class RentDetailView extends GetView<RentDetailController> {
  const RentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RentDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RentDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
