import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/quickalert.dart';

import '../../../data/constant/global_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/base_64_converter.dart';
import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FloatingActionButton.small(
                onPressed: () => Get.back(),
                backgroundColor: Colors.black38,
                elevation: 0,
                shape: const CircleBorder(),
                child: const Icon(Icons.close, color: Colors.white),
              )),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: SingleChildScrollView(
              child: _bookDetails(context)
          ),
        )
    );
  }

  Widget _bookDetails(BuildContext context) {
    return Obx(() {
      var bookDetail = controller.bookDetail.value;
      var state = controller.genreData.value;
      var ratingDat = controller.ratingData.value;
      if (bookDetail == null) {
        return Text('No Data');
      } else {
        return Column(
          children: [
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                width: double.infinity,
                child: Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: ImageConverter.base64ToImage(bookDetail.cover ?? '-'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
      ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  bookDetail.title ?? '-',
                  style: TextStyle(
                      color: GlobalColor.title,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  bookDetail.writer ?? '-',
                  style: TextStyle(
                      color: GlobalColor.subtitle, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RatingBarIndicator(
                  rating: (bookDetail.rating ?? 0).toDouble(),
                  itemCount: 5,
                  itemSize: 35,
                  unratedColor: Colors.black12,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: GlobalColor.softDeep,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.shopping_cart,
                        size: 30, color: GlobalColor.title),
                    Text((bookDetail.rented).toString(),
                        style: TextStyle(
                            color: GlobalColor.soft, fontSize: 23))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              width: Get.width,
              decoration: BoxDecoration(
                border:
                Border(top: BorderSide(width: 1, color: GlobalColor.soft)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (bookDetail.publishYear ?? '-').toString(),
                    style: TextStyle(
                        color: GlobalColor.subtitle,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (bookDetail.publisher ?? '-').toString(),
                    style: TextStyle(
                        color: GlobalColor.subtitle,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: GlobalColor.soft)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Synopsis',
                        style: TextStyle(
                            color: GlobalColor.subtitle,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //color: Color(0xff9585ff),
                      child: Text(
                        (bookDetail.synopsis).toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                            color: GlobalColor.text, fontSize: 18),
                      ),
                    ),
                  ]),
            ),

            // Genre Build
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: GlobalColor.soft)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            'Genre',
                            style: TextStyle(
                                color: GlobalColor.subtitle,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Get.toNamed(Routes.ADD_RELATION, parameters: {
                                'id' : (bookDetail.id).toString(),
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                              const EdgeInsets.all(0),
                              backgroundColor: GlobalColor.soft,
                              elevation: 5,
                              shape: CircleBorder(),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //color: Color(0xff9585ff),
                      child: SizedBox(
                          width: Get.width,
                          height: 43,
                          child: state != null ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  child: InkWell(
                                    onTap: (){
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error,
                                        showCancelBtn: true,
                                        showConfirmBtn: true,
                                        onConfirmBtnTap: () => controller.unlink(state[index].id),
                                        text:
                                        'Are you sure you want to Unlink this genre?',
                                        confirmBtnText: 'Delete',
                                        title: 'Confirmation',
                                        cancelBtnText: 'keep',
                                        confirmBtnColor: Colors.red,
                                        animType: QuickAlertAnimType.scale,
                                      );
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7.0)),
                                      child: Container(
                                          height: 30,
                                          margin: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Text(
                                            state[index].genre!.genre.toString(),
                                            style: TextStyle(
                                                color: GlobalColor.soft, fontSize: 20),
                                            textAlign: TextAlign.left,
                                          )
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ) : Text('No Genre Yet')
                      ),
                    ),
                  ]),
            ),

            // Rating Build
            ratingDat != null ? Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(width: 1, color: GlobalColor.soft)),
                ),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  //color: Color(0xff9585ff),
                  child: SizedBox(
                      width: Get.width,
                      height: 200,
                      child: ListView.builder(
                        //scrollDirection: Axis.horizontal,
                          itemCount: ratingDat.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.black, width: 2),
                                              image: DecorationImage(
                                                image: ImageConverter.base64ToImage(ratingDat[index].user?.profile?? '-'),
                                                fit: BoxFit.cover,
                                              )
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ratingDat[index].user!.name.toString(),
                                              style: TextStyle(
                                                  color: GlobalColor.subtitle, fontSize: 20),
                                              textAlign: TextAlign.left,
                                            ),
                                            RatingBarIndicator(
                                              rating: (ratingDat[index].rating ?? 1),
                                              itemCount: 5,
                                              itemSize: 35,
                                              unratedColor: Colors.black12,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: GlobalColor.softDeep,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            );
                          }
                      )
                  ),
                )
            ) : SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(
                    onPressed: (){
                      Get.toNamed(Routes.EDIT_BOOK, parameters: {
                        'id' : (bookDetail.id).toString(),
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                      const EdgeInsets.all(20),
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        showCancelBtn: true,
                        showConfirmBtn: true,
                        onConfirmBtnTap: () => controller.delete(),
                        text:
                        'Are you sure you want to Delete this book?',
                        confirmBtnText: 'Delete',
                        title: 'Confirmation',
                        cancelBtnText: 'keep',
                        confirmBtnColor: Colors.red,
                        animType: QuickAlertAnimType.scale,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                      const EdgeInsets.all(20),
                      backgroundColor: Colors.red,
                      elevation: 5,
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: ()=>controller.getData(),
                    style: ElevatedButton.styleFrom(
                      padding:
                      const EdgeInsets.all(20),
                      backgroundColor: GlobalColor.soft,
                      elevation: 5,
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),

                ],
              ),
            )
          ],
        );
      }
    });
  }

}
