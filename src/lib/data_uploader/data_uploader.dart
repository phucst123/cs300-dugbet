import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/models/CategoryModel.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/models/TransactionModel.dart';
import 'package:dugbet/models/UserModel.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {

    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //print(manifestMap);
    
    //load json file and print path
    var batch = firestore.batch();

    // upload Categories collection onto Firestore
    final assetsCategories = manifestMap.keys
        .where((path) =>
            (path.startsWith("assets/DB/Categories") && path.contains(".json"))
          )
        .toList();
    List<CategoryModel> categoryData = [];
    for (var file in assetsCategories) {
      String content = await rootBundle.loadString(file);
      categoryData
          .add(CategoryModel.fromJson(json.decode(content)));
    }
    for (var categorySet in categoryData) {
      print(categorySet.id);
      batch.set(firestore.collection('Categories').doc(categorySet.id), {
        "id": categorySet.id,
        "userId": categorySet.userId,
      });
      // for obtaining a reference path to a category document
      DocumentReference categoryRF({
        required String categorySetId,
        required String categoryId
      }) => firestore.collection('Categories').doc(categorySetId).collection('categories').doc(categoryId);
      // for obtaining a reference path to a subcategory document
      DocumentReference subCategoryRF({
        required String categorySetId,
        required String categoryId,
        required String subCategoryId
      }) => firestore.collection('Categories').doc(categorySetId).collection('categories').doc(categoryId)
                      .collection('subCategories').doc(subCategoryId);
      for (var category in categorySet.categories) {
        final categoryPath = categoryRF(categorySetId: categorySet.id, categoryId: category.id);
        batch.set(categoryPath, {
          "id": category.id,
          "title": category.title,
          "icon": category.icon,
        });
        for (var subcategory in category.subCategories) {
          final subCategoryPath = subCategoryRF(
            categorySetId: categorySet.id,
            categoryId: category.id,
            subCategoryId: subcategory.id
          );
          batch.set(subCategoryPath, {
            "id": subcategory.id,
            "title": subcategory.title,
            "icon": subcategory.icon,
          });
        }
      }
    }

    // upload Events collection onto Firestore
    final assetsEvents = manifestMap.keys
        .where((path) =>
            (path.startsWith("assets/DB/Events") && path.contains(".json"))
          )
        .toList();
    List<EventModel> eventData = [];
    for (var file in assetsEvents) {
      String content = await rootBundle.loadString(file);
      eventData
          .add(EventModel.fromJson(json.decode(content)));
    }
    for (var event in eventData) {
      print(event.id);
      batch.set(firestore.collection('Events').doc(event.id), {
        "id": event.id,
        "name": event.name,
        "description": event.description,
        "startDate": event.startDate,
        "endDate": event.endDate,
        "initialAmount": event.initialAmount,
      });
      DocumentReference eventRF({
        required String eventId,
        required String transactionId
      }) => firestore.collection('Events').doc(eventId).collection('transactions').doc(transactionId);
      for (var transaction in event.transactions) {
        final transactionPath = eventRF(eventId: event.id, transactionId: transaction.id);
        batch.set(transactionPath, {
          "id": transaction.id,
        });
      }
      DocumentReference eventMemberRF({
        required String eventId,
        required String memberId
      }) => firestore.collection('Events').doc(eventId).collection('members').doc(memberId);
      for (var member in event.members) {
        final memberPath = eventMemberRF(eventId: event.id, memberId: member.id);
        batch.set(memberPath, {
          "id": member.id,
        });
      }
    }

    // upload Transactions collection onto Firestore
    final assetsTransactions = manifestMap.keys
        .where((path) =>
            (path.startsWith("assets/DB/Transactions") && path.contains(".json"))
          )
        .toList();
    List<TransactionModel> transactionData = [];
    for (var file in assetsTransactions) {
      String content = await rootBundle.loadString(file);
      transactionData
          .add(TransactionModel.fromJson(json.decode(content)));
    }
    for (var transaction in transactionData) {
      print(transaction.transactionId);
      batch.set(firestore.collection('Transactions').doc(transaction.transactionId), {
        "transactionId": transaction.transactionId,
        "amount": transaction.amount,
        "category": transaction.category,
        "subCategory": transaction.subCategory,
        "date": transaction.date,
        "description": transaction.description,
        "title": transaction.title,
        "type": transaction.type,
        "isIncome": transaction.isIncome,
        "payerId": transaction.payerId,
        "walletId": transaction.walletId,
      });
      DocumentReference transactionMemberRF({
        required String transactionId,
        required String memberId
      }) => firestore.collection('Transactions').doc(transactionId).collection('members').doc(memberId);
      for (var member in transaction.members) {
        final memberPath = transactionMemberRF(transactionId: transaction.transactionId, memberId: member.id);
        batch.set(memberPath, {
          "id": member.id,
        });
      }
    }

    // upload Users collection onto Firestore
    final assetsUsers = manifestMap.keys
        .where((path) =>
            (path.startsWith("assets/DB/Users") && path.contains(".json"))
          )
        .toList();
    List<UserModel> userData = [];
    for (var file in assetsUsers) {
      String content = await rootBundle.loadString(file);
      userData
          .add(UserModel.fromJson(json.decode(content)));
    }
    for (var user in userData) {
      print(user.userId);
      batch.set(firestore.collection('Users').doc(user.userId), {
        "userId": user.userId,
        "username": user.username,
      });
      DocumentReference userSettingsRF({
        required String userId,
        required String section
      }) => firestore.collection('Users').doc(userId).collection('settings').doc(section);
      batch.set(userSettingsRF(userId: user.userId, section: 'profile'), {
        "section": 'profile',
        "email": user.settings[0].email,
        "name": user.settings[0].name,
        "dob": user.settings[0].dob,
        "gender": user.settings[0].gender
      });
      batch.set(userSettingsRF(userId: user.userId, section: 'notification'), {
        "section": 'notification',
        "pushNotification": user.settings[1].pushNotification,
        "inAppNotification": user.settings[1].inAppNotification,
        "sound": user.settings[1].sound,
        "vibrate": user.settings[1].vibrate,
        "eventReminder": user.settings[1].eventReminder,
        "targetReminder": user.settings[1].targetReminder,
      });
      batch.set(userSettingsRF(userId: user.userId, section: 'appearance'), {
        "section": user.settings[2].section,
      });
      batch.set(userSettingsRF(userId: user.userId, section: 'security'), {
        "section": user.settings[3].section,
        "enablePin": user.settings[3].enablePin,
      });
      batch.set(userSettingsRF(userId: user.userId, section: 'privacy_policy'), {
        "section": user.settings[4].section,
      });
      batch.set(userSettingsRF(userId: user.userId, section: 'contact_us'), {
        "section": user.settings[5].section,
      });
      batch.set(userSettingsRF(userId: user.userId, section: 'purchase'), {
        "section": user.settings[6].section,
      });
      DocumentReference userTransactionsRF({
        required String userId,
        required String transactionId
      }) => firestore.collection('Users').doc(userId).collection('transactions').doc(transactionId);
      for (var transaction in user.transactions) {
        final transactionPath = userTransactionsRF(userId: user.userId, transactionId: transaction.id);
        batch.set(transactionPath, {
          "id": transaction.id,
        });
      }
      DocumentReference userWalletsRF({
        required String userId,
        required String walletId
      }) => firestore.collection('Users').doc(userId).collection('wallets').doc(walletId);
      for (var wallet in user.wallets) {
        final walletPath = userWalletsRF(userId: user.userId, walletId: wallet.id);
        batch.set(walletPath, {
          "id": wallet.id,
        });
      }
    }

    // upload Wallets collection onto Firestore
    final assetsWallets = manifestMap.keys
        .where((path) =>
            (path.startsWith("assets/DB/Wallets") && path.contains(".json"))
          )
        .toList();
    List<WalletModel> walletData = [];
    for (var file in assetsWallets) {
      String content = await rootBundle.loadString(file);
      walletData
          .add(WalletModel.fromJson(json.decode(content)));
    }
    for (var wallet in walletData) {
      print(wallet.id);
      batch.set(firestore.collection('Wallets').doc(wallet.id), {
        "id": wallet.id,
        "walletPicture": wallet.walletPicture,
        "description": wallet.description,
        "initialAmount": wallet.initialAmount,
        "expense": wallet.expense,
        "income": wallet.income,
        "name": wallet.name,
        "type": wallet.type,
      });
      DocumentReference walletTransactionsRF({
        required String walletId,
        required String transactionId
      }) => firestore.collection('Wallets').doc(walletId).collection('transactions').doc(transactionId);
      for (var transaction in wallet.transactions) {
        final transactionPath = walletTransactionsRF(walletId: wallet.id, transactionId: transaction.id);
        batch.set(transactionPath, {
          "id": transaction.id,
        });
      }
    }
    await batch.commit();
  }
}