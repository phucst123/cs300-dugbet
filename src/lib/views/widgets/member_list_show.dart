import 'package:dugbet/views/widgets/list_title_member.dart';
import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class MemberListShow extends StatelessWidget {
  const MemberListShow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width-40,
            height: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorPalette.white
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    style: TextThemeBuilder.robotoTextTheme.titleSmall,
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
                  Text("Members(3)",style: TextThemeBuilder.robotoTextTheme.titleLarge,textAlign: TextAlign.left,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height - 170,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 8,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 280,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: ColorPalette.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                    child: ListTitleMember(username: "Anonymous", email: "hungnp123@gmail.com")
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
