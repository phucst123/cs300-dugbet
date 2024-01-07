import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;

Reference get firebaseStorage => FirebaseStorage.instance.ref();

//final userRF = firestore.collection('users');