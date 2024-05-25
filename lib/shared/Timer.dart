// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, unused_local_variable, avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

DeleteItem(
    {required String requstedProdactUid,
    required String notifiyProdactUid,
    int hour = 0,
    required int seconds}) async {
  Timer repeatedFunction = Timer.periodic(
    Duration(hours: hour, seconds: seconds),
    (timer) async {
      try {
        final requstedProdactUIDexist = FirebaseFirestore.instance
            .collection('RequstedDDD')
            .doc(requstedProdactUid);

        final docSnapshot = await requstedProdactUIDexist.get();
        final NotifiyProdactUidexist = FirebaseFirestore.instance
            .collection('notifiayYYY')
            .doc(notifiyProdactUid);

        final docSnapshot2 = await NotifiyProdactUidexist.get();

        if (docSnapshot.exists && docSnapshot2.exists) {
          await FirebaseFirestore.instance
              .collection("RequstedDDD")
              .doc(requstedProdactUid)
              .delete();
          await FirebaseFirestore.instance
              .collection("notifiayYYY")
              .doc(notifiyProdactUid)
              .delete();
        }
      } catch (e) {
        print("already removing  after  $e");
      }
    },
  );
}
