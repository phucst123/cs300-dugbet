import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/models/UtilityModel.dart';
import 'package:dugbet/models/WalletModel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_controller.dart';
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
  var isLoadingWallet = true.obs;
  var isLoadingEvent = true.obs;


  //String? user_id;
  @override
  void onReady() {
    super.onReady();
  }
  void loadingData() {
    isLoadingWallet.value = true;
    isLoadingEvent.value = true;
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
    if (isLoadingWallet.value) {
      isLoadingWallet.value = false;
    }
    else return;
    print("im here to read wallet page");
    String? user_id = user!.email;
    try {
      QuerySnapshot wallets = await usersRef.doc(user_id).collection('Wallets').get();
      walletList.clear();
      for (var wallet in wallets.docs) {
        //print("im here to read ${wallet.data()}");
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
    if (isLoadingEvent.value) {
      isLoadingEvent.value = false;
    }
    else return;
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

  Future <void> addWallet(String name, String walletPicture, String description, String id, String type, int income, int expense, int initialAmount) async {
    String? user_id = user!.email;
    print('im here to add new wallet');
    try {
      await usersRef.doc(user_id).collection('Wallets').doc(id).set({
        'name': name,
        'walletPicture': walletPicture,
        'description': description,
        'id': id,
        'type': type,
        'income': income,
        'expense': expense,
        'initialAmount': initialAmount,
      });
      print('add wallet successfully');
      getWallets();
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while adding wallet',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void debug() {
    print("Hello how are you im wallet controller");
  }

  // update wallet data fo firestore
  Future<void> updateWallet() async {
    String? user_id = user!.email;
    // get transaction list from transaction list controller
    var transactionListController = Get.find<HomeController>();
    var transactionList = transactionListController.transactionListModel;
    // update income and expense of wallet
    print("im here to update wallet consistent, wallet list length: ${walletList.length}");

    for (var wallet in walletList) {
      int newIncome = 0;
      int newExpense = 0;
      for (var transaction in transactionList) {
        if (transaction.walletId != wallet.id) continue;
        if (transaction.isIncome) {
          newIncome += transaction.amount;
        } else {
          newExpense += transaction.amount;
        }
      }
      {
        try {
          await usersRef
              .doc(user_id)
              .collection('Wallets')
              .doc(wallet.id)
              .update({
            'income': newIncome,
            'expense': newExpense,
            'initialAmount': 650000,
          });
        } catch (e) {
          print(e);
        }
      }

    }

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
