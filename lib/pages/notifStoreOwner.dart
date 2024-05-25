// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project2/Controller/ResponsiveController.dart';
import 'package:graduation_project2/Provider/Notifecation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NotifayStoreOwner extends StatefulWidget {
  const NotifayStoreOwner({super.key});

  @override
  State<NotifayStoreOwner> createState() => _NotifayStoreOwnerState();
}

class _NotifayStoreOwnerState extends State<NotifayStoreOwner> {
  late final Stream<QuerySnapshot> _usersStream;
  @override
  void initState() {
    super.initState();
    _usersStream = FirebaseFirestore.instance
        .collection('notifiayYYY')
        .where("uidStorOwner",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    Provider.of<Notificationn>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 76, 141, 95),
          title: Text("NotifayStoreOwner  "),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: widthScreen > 600
                  ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
                  : const EdgeInsets.all(0),
              child: Column(
                children: [
                  Container(
                      height: 600,
                      margin: EdgeInsets.only(bottom: 20),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: _usersStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text("Loading");
                            }

                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map<String, dynamic> data =
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>;

                                  return Card(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "${data["imgPost"]}"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "username ${data["usernameStoreOwner"]} "),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "price: ${data["price"]} "),
                                                Text(
                                                    "title: ${data["title"]} "),
                                                Text(
                                                    "quantity: ${data["partquntity"]} "),
                                                Text(
                                                    "ProdactName: ${data["prodactName"]} "),
                                              ],
                                            ),
                                          ],
                                        ),
                                        !data["farmerRejectedRequest"]
                                            ? Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      ResponsiveController()
                                                          .whatsAppMessage();
                                                    },
                                                    child: SvgPicture.asset(
                                                        "assets/icons8-whatsapp.svg"),
                                                  ),
                                                  IconButton(
                                                      onPressed: () async {
                                                        ResponsiveController()
                                                            .StoreOwnerCheckDelivery(
                                                                data: data,
                                                                doc: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .id,
                                                                context:
                                                                    context);
                                                      },
                                                      icon: Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      )),
                                                ],
                                              )
                                            : TextButton(
                                                onPressed: () async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('notifiayYYY')
                                                      .doc(snapshot
                                                          .data!.docs[index].id)
                                                      .delete();
                                                },
                                                child: Text(
                                                  "Rejcted",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                      ],
                                    ),
                                  );
                                });
                          })),
                ],
              ),
            ),
          ),
        ));
  }
}
