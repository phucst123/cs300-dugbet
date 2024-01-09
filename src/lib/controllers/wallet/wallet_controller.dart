import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/models/WalletModel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class WalletController extends GetxController {
  var isWallet = true.obs;
  var walletList = <WalletModel>[];

  @override
  void onReady() {
    super.onReady();
  }

  void onInit() {
    super.onInit();
  }

  void switchMode(bool isWallet) {
    this.isWallet.value = isWallet;
  }
  

  // For wallets
  Future<void> getWallets() async {
    try {
      QuerySnapshot wallets = await FirebaseFirestore.instance
          .collection('Users')
          .doc('vinh123@gmail.com')
          .collection('Wallets')
          .get();
      walletList.clear();
      for (var wallet in wallets.docs) {
        print("im here to read ${wallet.data()}");
        walletList
            .add(WalletModel.fromDocumentSnapshot(documentSnapshot: wallet));
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting wallet list',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> addWallets(WalletModel walletAdd) async {}

  Future<void> updateWallet(WalletModel walletUp) async {}

  Stream<List<WalletModel>> readWallet() {
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .doc('vinh123@gmail.com')
        .collection('Wallets');
    return collection.snapshots().map((event) =>
        event.docs.map((e) => WalletModel.fromJson(e.data())).toList());
  }

  // For trip/ events
  Future<void> getEventWallets() async {}

  Future<void> addEventWallet(EventModel event) async {}

  Future<void> updateEventWallet(EventModel event) async {}

  Future<void> getOneEventWallet() async {}
}
