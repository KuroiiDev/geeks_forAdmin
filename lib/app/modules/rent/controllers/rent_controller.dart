import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geeks_foradmin/app/data/model/response_rent_get.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class RentController extends GetxController with StateMixin {

  var rentData = Rxn<List<DataRent>>();

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
    rentData.value = null;
    try {
      final response = await ApiProvider.instance().get(Endpoint.rent);
      if (response.statusCode == 200) {
        final ResponseRentGet responseBook = ResponseRentGet.fromJson(response.data);
        if (responseBook.data!.isEmpty){
          log("Empty Data!");
        }else{
          rentData(responseBook.data);
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
