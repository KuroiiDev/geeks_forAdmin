import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_user_get.dart';
import '../../../data/provider/api_provider.dart';

class StaffController extends GetxController with StateMixin{

  var userData = Rxn<List<DataUser>>();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> getData() async{
    userData.value = null;
    try {
      final response = await ApiProvider.instance().get(Endpoint.staff);
      if (response.statusCode == 200) {
        final ResponseUserGet responseBook = ResponseUserGet.fromJson(response.data);
        if (responseBook.data!.isEmpty){
          log("Empty Data!");
        }else{
          userData(responseBook.data);
        }
      } else {
        log("Internal Server Error");
      }
    }on DioException catch(e) {
      if (e.response != null){
        if (e.response?.data != null){
          log("${e.response?.data['message']}']");
        }
      } else {
        log(e.message ?? "");
      }
    }catch (e) {
      log(e.toString());
    }
  }
}
