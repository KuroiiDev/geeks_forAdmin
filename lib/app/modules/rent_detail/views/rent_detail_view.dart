import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/global_color.dart';
import '../../../widgets/base_64_converter.dart';
import '../controllers/rent_detail_controller.dart';

class RentDetailView extends GetView<RentDetailController> {
  const RentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code: ${Get.parameters['id']}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: Obx(() {
          var state = controller.rentData.value;
          if (state == null) {
            return const Text('Kosong');
          } else {
            return Column(
              children: [
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: double.infinity,
                    child: Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 5, color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                    ImageConverter.base64ToImage(state.book?.cover ?? '-'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      state.book?.title ?? '-',
                      style: TextStyle(
                          color: GlobalColor.title,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.book?.writer ?? '-',
                      style: TextStyle(
                          color: GlobalColor.subtitle, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: GlobalColor.soft)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rent: ${(state.rentDate ?? '-').toString()}',
                        style: TextStyle(
                            color: GlobalColor.subtitle,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Return: ${(state.returnDate ?? '-').toString()}',
                        style: TextStyle(
                            color: GlobalColor.subtitle,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: Get.width,
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal:
                          BorderSide(width: 1, color: GlobalColor.soft)),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2),
                                image: DecorationImage(
                                  image: ImageConverter.base64ToImage(state.user?.profile?? '-'),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${(state.user?.name).toString()}',
                                style: TextStyle(
                                    color: GlobalColor.subtitle,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${(state.user?.email).toString()}',
                                style: TextStyle(
                                    color: GlobalColor.softDeep,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    )
                ),
                SizedBox(height: 20),
                Text(
                  '${(state.status).toString()}',
                  style: TextStyle(
                      color: GlobalColor.softDeep,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                state.status != 'RETURNED' ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    state.status == 'BOOKED' ? ElevatedButton.icon(
                      onPressed: () => controller.verify(),
                      label: const Text("Verify",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      icon: const Icon(Icons.verified_user, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        backgroundColor: Colors.green,
                        elevation: 5,
                        shape: const StadiumBorder(),
                      ),
                    ): SizedBox(),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("Return",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      icon: const Icon(Icons.back_hand, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        backgroundColor: Colors.red,
                        elevation: 5,
                        shape: const StadiumBorder(),
                      ),
                    )
                  ],
                ) : SizedBox()
              ],
            );
          }
        })),
      ),
    );
  }
}
