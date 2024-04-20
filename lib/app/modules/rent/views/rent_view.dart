import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/widgets/base_64_converter.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../data/constant/global_color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/rent_controller.dart';

class RentView extends GetView<RentController> {
  const RentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RentView'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Container(
        child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: LiquidPullToRefresh(
                color: Colors.deepPurpleAccent,
                onRefresh: controller.getData,
                child: Obx(() {
                  var state = controller.rentData.value;
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
                            onTap: () {Get.toNamed(Routes.RENT_DETAIL, parameters: {'id' : state[index].id.toString()});},
                            child: Card(
                              elevation: 5.0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: ImageConverter.base64ToImage(state[index].book?.cover ?? '-'),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '${state[index].book?.title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.title,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rent Date: ${state[index].rentDate}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.soft,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Return Date: ${state[index].returnDate}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.softDeep,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.black, width: 1),
                                                  image: DecorationImage(
                                                    image: ImageConverter.base64ToImage(state[index].user?.profile ?? '-'),
                                                    fit: BoxFit.cover,
                                                  )
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              '${state[index].user?.name}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: GlobalColor.subtitle,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: state.length);
                  }
                })
            )
        ),
      )
    );
  }
}
