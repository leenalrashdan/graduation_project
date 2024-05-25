// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Notificationn with ChangeNotifier {
  int count = 0;

  int getCount() {
    FirebaseFirestore.instance
        .collection('notifiayYYY')
        .where("uidStorOwner",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      count = snapshot.docs.length;
    });

    return count;
  }

  void ref() {
    notifyListeners();
  }
}
