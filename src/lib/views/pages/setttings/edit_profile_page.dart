import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/controllers/setting/edit_profile_controller.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

final contentStyle = theme.textTheme.bodyLarge!
    .merge(const TextStyle(fontWeight: FontWeight.bold));
final titleStyle = theme.textTheme.bodySmall!
    .merge(const TextStyle(fontWeight: FontWeight.bold));

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomIconButton(
                  child: Transform.flip(
                    flipX: true,
                    child: SvgPicture.asset(
                      "assets/icons/arrow.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
                  ),
                  callback: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          titleSpacing: 0,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Form(
                    key: controller.profileFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Edit Profile",
                            style: context.textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorPalette.defaultText),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Name",
                                  style: titleStyle,
                                ),
                                SizedBox(height: 4.v),
                                TextFormField(
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'Name'),
                                  controller: controller.nameController,
                                  onSaved: (newValue) {
                                    if (newValue != null) {
                                      controller.nameController.text = newValue;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  style: contentStyle,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorPalette.defaultText),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Email", style: titleStyle),
                                SizedBox(
                                  height: 4.v,
                                ),
                                Text(controller.user.value!.email!,
                                    style: contentStyle),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            width: double.infinity,
                            // height: 72,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorPalette.defaultText),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Date of birth", style: titleStyle),
                                SizedBox(
                                  height: 4.v,
                                ),
                                InkWell(
                                  child: Text(
                                    DateFormat("dd-MM-yyyy")
                                        .format(controller.dob.value)
                                        .toString(),
                                    style: contentStyle,
                                  ),
                                  onTap: () => controller.chooseDate(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            width: double.infinity,
                            // height: 72,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorPalette.defaultText),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Gender", style: titleStyle),
                                SizedBox(height: 4.v),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: const SizedBox.shrink(),
                                    hint: Text(
                                      'Choose gender',
                                      style: contentStyle,
                                    ),
                                    onChanged: (newValue) {
                                      controller.setSelected(newValue);
                                    },
                                    isExpanded: true,
                                    isDense: true,
                                    value: controller.gender.value == ""
                                        ? null
                                        : controller.gender.value,
                                    items: [
                                      DropdownMenuItem(
                                          value: "male",
                                          child: Text(
                                            "Male",
                                            style: contentStyle,
                                          )),
                                      DropdownMenuItem(
                                          value: "female",
                                          child: Text(
                                            "Female",
                                            style: contentStyle,
                                          )),
                                      DropdownMenuItem(
                                          value: "other",
                                          child: Text(
                                            "Other",
                                            style: contentStyle,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StringButton(
                              text: "Update",
                              callback: () {
                                controller.updateProfile();
                              },
                              decoration: CustomButtonStyles
                                  .gradientTealToTealDecoration,
                              buttonStyle: CustomButtonStyles.none,
                              buttonTextStyle: context.textTheme.labelLarge!
                                  .merge(const TextStyle(
                                      color: ColorPalette.white))),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
