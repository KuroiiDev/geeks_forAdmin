import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_genre_controller.dart';

class AddGenreView extends GetView<AddGenreController> {
  const AddGenreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddGenreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddGenreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
