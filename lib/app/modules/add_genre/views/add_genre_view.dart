import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_genre_controller.dart';

class AddGenreView extends GetView<AddGenreController> {
  const AddGenreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Genre'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          child: _buildInputFields(),
        ),
      )
    );
  }

  Widget _buildInputFields(){
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Form(
                key: controller.formKey,
                child:Column(
                  children: [
                    _buildGenreField(),
                    const SizedBox(height: 30),
                    _buildButtonLogin(),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenreField(){
    return TextFormField(
      controller: controller.genreController,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        hintText: "Genre",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 20),
        prefixIcon: const Icon(
          Icons.category,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      validator: (value){
        if (value!.isEmpty){
          return "Please Fill the Genre Field!";
        }
        return null;
      },
    );
  }
  Widget _buildButtonLogin(){
    return ElevatedButton.icon(
      onPressed: ()=>controller.addGenre(),
      label: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 25)),
      icon: const Icon(Icons.add, color: Colors.white),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        backgroundColor: Colors.deepPurple,
        elevation: 5,
        shape: const StadiumBorder(),
      ),
    );
  }
}
