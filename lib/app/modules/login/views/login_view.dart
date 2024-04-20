import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
                child: _buildInputFields(),
          ),
        )
    );
  }

  //Personal Widget..

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
              const Text(
                  "Welcome Staff!",
                  style:TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1
                  )
              ),
              const SizedBox(height: 60),
              Form(
                  key: controller.formKey,
                  child:Column(
                    children: [
                      _buildEmailField(),
                      const SizedBox(height: 20),
                      Obx(() =>
                          _buildPasswordField()
                      ),
                      const SizedBox(height: 30),
                      _buildButtonLogin(),
                      const SizedBox(height: 15),
                    ],
                  )
              ),
            ],
          ),
        ),
    );
  }

  // Micro Widget..

  Widget _buildEmailField(){
    return TextFormField(
      controller: controller.emailController,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 20),
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      obscureText: false,
      validator: (value){
        if (value!.isEmpty){
          return "Please Fill out your email!";
        }else if (!EmailValidator.validate(value.toString())){
          return "Invalid Email Address";
        }
        return null;
      },
    );
  }
  Widget _buildPasswordField(){
    return TextFormField(
      controller: controller.passwordController,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          icon: controller.isObs.value ? const Icon(Icons.visibility, color: Colors.white,) : const Icon(Icons.visibility_off, color: Colors.white,),
          onPressed: () {
            controller.obscurePass();
          },
        ),
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 20),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      obscureText: controller.isObs.value,
      validator: (value){
        if (value!.isEmpty){
          return "Please Fill out your password!";
        }
        return null;
      },
    );
  }
  Widget _buildButtonLogin(){
    return ElevatedButton.icon(
      onPressed: ()=>controller.login(),
      label: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 25)),
      icon: const Icon(Icons.login, color: Colors.white),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        backgroundColor: const Color(0xace2d1ff),
        elevation: 5,
        shape: const StadiumBorder(),
      ),
    );
  }
}
