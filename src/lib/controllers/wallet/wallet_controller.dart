import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/models/WalletModel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletController extends GetxController {
  var isWallet = true.obs;
  RxBool onPersonal = true.obs;
  var walletList = <WalletModel>[];
  var eventList = <EventModel>[];
  late User? user;

  final TextEditingController incomeTextEdit = TextEditingController();
  final TextEditingController descriptionTextEdit = TextEditingController();
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedWallet = "Momo".obs;
  var isIncome = true.obs;
  var isEdit = false.obs;
  var bankIcon = "Momo".obs;
  var  type = 0.obs;



  //String? user_id;
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onInit() {
    super.onInit();
    user = Get.find<AuthController>().getUser();
    //user_id = user!.email;
    getWallets();
    getEvents();
  }

  void switchMode(bool value) {
    onPersonal.value = value;
  }

  Future<void> getWallets() async {
    print("im here to read wallet");
    String? user_id = user!.email;
    try {
      QuerySnapshot wallets = await usersRef.doc(user_id).collection('Wallets').get();
      walletList.clear();
      for (var wallet in wallets.docs) {
        print("im here to read ${wallet.data()}");
        walletList
            .add(WalletModel.fromDocumentSnapshot(documentSnapshot: wallet));
      }
      update();
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting wallet list',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future <void> getEvents() async {
    print("im here to read event");
    String? user_id = user!.email;
    try {
      QuerySnapshot events = await usersRef.doc(user_id).collection('Events').get();
      eventList.clear();
      for (var event in events.docs) {
        //print("im here to read ${wallet.data()}");
        eventList
            .add(EventModel.fromDocumentSnapshot(documentSnapshot: event));
      }
      update();
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting event list',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void debug() {
    print("Hello how are you im wallet controller");
  }

  // Stream<List<WalletModel>> readWallet() {
  //   var collection = FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc('vinh123@gmail.com')
  //       .collection('Wallets');
  //   return collection.snapshots().map((event) =>
  //       event.docs.map((e) => WalletModel.fromJson(e.data())).toList());
  // }
}
