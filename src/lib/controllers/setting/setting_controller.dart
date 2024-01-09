import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';

class SettingController extends GetxController {
  final isPremium = false.obs;
  final email = "".obs;
  final name = "".obs;

  @override
  void onInit() {
    super.onInit();
    var user = Get.find<AuthController>().getUser()!;
    email.value = user.email!;
    name.value = user.displayName!;
    print(email.value);
    print(name.value);
  }
}
