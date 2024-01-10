import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/pages/transaction/event_transaction_controller.dart';
import 'package:dugbet/views/widgets/list_title_member.dart';
import 'package:dugbet/views/widgets/normal_header_bar.dart';
import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';
import '../pages/transaction/user_model_demo.dart';

class MemberList extends StatelessWidget {
  const MemberList({super.key});

  @override
  Widget build(BuildContext context) {
    EventTransactionController controller;
    if (Get.isRegistered<EventTransactionController>()) {
      controller = Get.find<EventTransactionController>();
    } else {
      controller =
          Get.put<EventTransactionController>(EventTransactionController());
    }

    return SafeArea(
      // minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            // height: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorPalette.white),
            child: SingleChildScrollView(
              child: Obx(() => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: ColorPalette.primaryColor,
                              border: Border.all(color: Colors.white,width: 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Icons.arrow_back,color: Colors.white,),
                          ),
                        ),
                        TextField(
                          onTap: () {},
                          style: TextThemeBuilder.robotoTextTheme.titleSmall,
                          controller: controller.searchText,
                          decoration: InputDecoration(
                              // fillColor:LightTheme.primaryColor,
                              // filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              hintText: "Search email...",
                              hintStyle: TextStyle(
                                  color: ColorPalette.grey.withOpacity(0.7),
                                  fontWeight: FontWeight.normal),
                              prefixIcon: const Icon(Icons.search)),
                        ),
                        Text("List Member",
                            style:
                                TextThemeBuilder.robotoTextTheme.displayLarge),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 170 - controller.listMember.value.length*80,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.listUserChoose.value.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.listMember
                                            .add(controller.listUserChoose.value[index]);
                                        controller.listUserChoose
                                            .remove(controller.listUserChoose.value[index]);
                                        // controller.listUserChoose.refresh();
                                        // controller.listMember.refresh();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 280,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: ColorPalette.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: ListTitleMember(
                                                    username: controller
                                                        .listUserChoose
                                                        .value[index]
                                                        .name,
                                                    email: controller
                                                        .listUserChoose
                                                        .value[index]
                                                        .email)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                        Text(
                          "Choose Member",
                          style: TextThemeBuilder.robotoTextTheme.displayLarge,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 170 - controller.listUserChoose.value.length*80,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.listMember.value.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.listUserChoose
                                            .add(controller.listMember.value[index]);

                                        controller.listMember
                                            .remove(controller.listMember.value[index]);
                                        // controller.listMember.refresh();
                                        // controller.listUserChoose.refresh();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 280,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: ColorPalette.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: ListTitleMember(
                                                    username: controller
                                                        .listMember
                                                        .value[index]
                                                        .name,
                                                    email: controller.listMember
                                                        .value[index].email)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
