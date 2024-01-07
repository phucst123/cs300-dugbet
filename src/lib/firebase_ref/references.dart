import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/models/CategoryModel.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/models/UserModel.dart';
import 'package:dugbet/models/UtilityModel.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/widgets/wallet.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Reference get firebaseStorage => FirebaseStorage.instance.ref();

final CollectionReference usersRef = firestore.collection('Users').withConverter<UserModel>(
  fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
  toFirestore: (user, _) => user.toJson(),
);

final CollectionReference walletsRef = firestore.collection('Wallets').withConverter<WalletModel>(
  fromFirestore: (snapshot, _) => WalletModel.fromJson(snapshot.data()!),
  toFirestore: (wallet, _) => wallet.toJson(),
);

final CollectionReference transactionsRef = firestore.collection('Transactions').withConverter<TransactionInfo>(
  fromFirestore: (snapshot, _) => TransactionInfo.fromJson(snapshot.data()!),
  toFirestore: (transaction, _) => transaction.toJson(),
);

final CollectionReference eventsRef = firestore.collection('Events').withConverter<EventModel>(
  fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
  toFirestore: (event, _) => event.toJson(),
);

final CollectionReference categoriesRef = firestore.collection('Categories').withConverter<CategoryModel>(
  fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
  toFirestore: (category, _) => category.toJson(),
);
