import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/widgets/base_64_converter.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../data/constant/global_color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
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
                  var state = controller.bookData.value;
                  if (state == null) {
                    return Center(
                      child: ListView(
                        children: [
                          SizedBox(height: Get.width, width: Get.width, child: const Center(child: Text('No Internet'))),
                        ],
                      ),
                    );
                  } else {
                    return GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 6,
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                                elevation: 5.0,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          child: Image(
                                            image: ImageConverter.base64ToImage(
                                                state[index].cover ?? '-'),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        '${state[index].id}.${state[index].title}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: GlobalColor.title,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(
                                        '${state[index].publisher}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: GlobalColor.subtitle,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(
                                        'Rating: ${state[index].rating}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: GlobalColor.subtitle,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 2, bottom: 10),
                                      child: state[index].status ==
                                          'AVAILABLE'
                                          ? Text(
                                        state[index].status ?? '-',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: CupertinoColors
                                                .activeGreen,
                                            fontSize: 12),
                                      )
                                          : Text(
                                        state[index].status ?? '-',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                        itemCount: state.length);
                  }
                }
                )
            )
        ),
      )
    );
  }
}
