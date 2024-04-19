import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_book_controller.dart';

class EditBookView extends GetView<EditBookController> {
  const EditBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditBookView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditBookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
