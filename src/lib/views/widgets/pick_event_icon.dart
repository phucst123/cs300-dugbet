import 'package:dugbet/views/pages/transaction/event_transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickEventIcon extends StatelessWidget {
  PickEventIcon({super.key});

  final eventIconList = ["12","13","14","15","16","17","18","19","20","21","22"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: eventIconList.map((icon) => IventIconChoose(icon)).toList(),
          ),
        ),
      ),
    );
  }
}

Widget IventIconChoose(String name) {
  return InkWell(
    onTap: () {
      EventTransactionController controller;
      if(Get.isRegistered<EventTransactionController>()){
        controller = Get.find<EventTransactionController>();
      }
      else{
        controller = Get.put<EventTransactionController>(EventTransactionController());
      }
      controller.title.value = name;
      Get.back();

    },
    child: Center(
      child: Image.asset("assets/Event/${name.toLowerCase()}.png",width: 50,height: 50,),
    ),
  );
}
