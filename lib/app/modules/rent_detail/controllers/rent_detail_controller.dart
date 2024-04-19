import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_rent_id_get.dart';
import '../../../data/provider/api_provider.dart';

class RentDetailController extends GetxController with StateMixin {

  var rentData = Rxn<DataRent>();

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

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    var rentId = Get.parameters['id'];
    try {
      final response = await ApiProvider.instance().get("${Endpoint.rent}/id/$rentId");
      if (response.statusCode == 200) {
        final ResponseRentIdGet responseRent = ResponseRentIdGet.fromJson(response.data);
        if (responseRent.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          rentData(responseRent.data);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  verify() async {
    var rentId = Get.parameters['id'];
    try {
      final response = await ApiProvider.instance().get("${Endpoint.rentVerify}/$rentId");
      if (response.statusCode == 200){
        Get.snackbar('Success', 'Verify Successful', backgroundColor: Colors.green);
      } else {
        Get.snackbar('Failed', 'Verify Failed', backgroundColor: Colors.red);
      }
      getData();
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
