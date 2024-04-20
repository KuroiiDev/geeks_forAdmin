import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quickalert/quickalert.dart';

import '../../../data/constant/global_color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/genre_controller.dart';

class GenreView extends GetView<GenreController> {
  const GenreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GenreView'),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>controller.routing(),
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(Icons.add),
        ),
        body: Container(
          child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: LiquidPullToRefresh(
                  color: Colors.deepPurpleAccent,
                  onRefresh: controller.getData,
                  child: Obx(() {
                    var state = controller.genreData.value;
                    if (state == null) {
                      return Center(
                        child: ListView(
                          children: [
                            SizedBox(
                                height: Get.width,
                                width: Get.width,
                                child:
                                    const Center(child: Text('No Internet'))),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  showCancelBtn: true,
                                  showConfirmBtn: true,
                                  onConfirmBtnTap: () => controller.deleteGenre(state[index].id),
                                  text:
                                  'Are you sure you want to delete this genre?',
                                  confirmBtnText: 'Delete',
                                  title: 'Confirmation',
                                  cancelBtnText: 'keep',
                                  confirmBtnColor: Colors.red,
                                  animType: QuickAlertAnimType.scale,
                                );
                              },
                              child: Card(
                                  elevation: 5.0,
                                  child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                        child: Text(
                                          '${state[index].id}.${state[index].genre}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.title,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                              ),
                            );
                          },
                          itemCount: state.length);
                    }
                  }))),
        )
    );
  }
}
