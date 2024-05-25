// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class RequstedProvider with ChangeNotifier {
  int count = 0;

  int getCountREQ() {
    FirebaseFirestore.instance
        .collection('RequstedDDD')
        .where("uidFarmer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      count = snapshot.docs.length;
    });

    return count;
  }
}
