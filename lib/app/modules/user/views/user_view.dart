import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../data/constant/global_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/base_64_converter.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Get.toNamed(Routes.STAFF),
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(Icons.admin_panel_settings_outlined),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: LiquidPullToRefresh(
                color: Colors.deepPurpleAccent,
                onRefresh: controller.getData,
                child: Obx(() {
                  var state = controller.userData.value;
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
                            onTap: () {},
                            child: Card(
                              elevation: 5.0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black, width: 2),
                                          image: DecorationImage(
                                            image: ImageConverter.base64ToImage(state[index].profile ?? '-'),
                                            fit: BoxFit.cover,
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
                                          '${state[index].name}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.title,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${state[index].email}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.soft,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Id: ${state[index].id}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: GlobalColor.soft,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
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
