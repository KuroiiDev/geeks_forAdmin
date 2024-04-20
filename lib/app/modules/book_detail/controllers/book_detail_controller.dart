import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book_id_get.dart';
import '../../../data/model/response_genre_book_get.dart';
import '../../../data/model/response_rating_get.dart';
import '../../../data/provider/api_provider.dart';

class BookDetailController extends GetxController with StateMixin {
  var bookDetail = Rxn<DataBookId>();
  var genreData = Rxn<List<DataGenre>>();
  var ratingData = Rxn<List<DataRating>>();

  @override
  void onInit() {
    super.onInit();
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
    var bookId = Get.parameters['id'];

    // Get Rating
    try {
      final response = await ApiProvider.instance().get("${Endpoint.rating}/$bookId");
      if (response.statusCode == 200) {
        final ResponseRatingGet responseRating = ResponseRatingGet.fromJson(response.data);
        if (responseRating.data!.isEmpty){
          log("Empty Data!");
        }else{
          ratingData(responseRating.data);
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


    // Get Genres
    try {
      final response = await ApiProvider.instance().get("${Endpoint.genre}/book/$bookId");
      if (response.statusCode == 200) {
        final ResponseGenreBook responseGenre = ResponseGenreBook.fromJson(response.data);
        if (responseGenre.data!.isEmpty){
          log("Empty Data!");
        }else{
          genreData(responseGenre.data);
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

    // Get Book Data
    try {
      final response =
      await ApiProvider.instance().get("${Endpoint.book}/id/$bookId");
      if (response.statusCode == 200) {
        final ResponseBookId responseBook =
        ResponseBookId.fromJson(response.data);
        if (responseBook.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          bookDetail(responseBook.data);
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

}
