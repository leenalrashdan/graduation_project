// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project2/shared/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateTimebarches extends StatefulWidget {
  const DateTimebarches({super.key});

  @override
  State<DateTimebarches> createState() => _DateTimebarchesState();
}

class _DateTimebarchesState extends State<DateTimebarches> {
  late final Stream<QuerySnapshot> _usersStream;
  @override
  void initState() {
    super.initState();
    _usersStream = FirebaseFirestore.instance
        .collection('RequstedDDD')
        .where("uidStorOwner",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of(context, listen: false);

    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 76, 141, 95),
          title: const Text("DateTimebarches  "),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: widthScreen > 600
                      ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
                      : const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        height: heightScreen - 250,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: _usersStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("Loading");
                              }

                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Map<String, dynamic> data =
                                        snapshot.data!.docs[index].data()
                                            as Map<String, dynamic>;
                                    return Card(
                                      child: Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(data["imgPost"]),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Farmer :  ${data["usernameFarmer"]} "),
                                              Text(
                                                  "Quantity: ${data["partquntity"]} "),
                                              Text(
                                                  "Price : ${data["price"]} for 1KG  "),
                                              Text(
                                                  "Total Price: ${(double.parse(data["price"]) * double.parse(data["partquntity"])).toString()} "),
                                              Text("title: ${data["title"]} "),
                                              Text(
                                                  "Prodact Name: ${data["prodactName"]} "),
                                              Text(
                                                  "Date of purchase:  ${data["datePublished"] == null ? data["datePublished"] : DateFormat('MMMM d, ' 'y').format(data["datePublished"].toDate())} ")
                                            ],
                                          ),
                                          const SizedBox(),
                                        ],
                                      )),
                                    );
                                  });
                            }),
                      ),
                      ElevatedButton(
                        onPressed: () async {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BTNgreen),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        child: const Text(
                          "click here",
                          style: TextStyle(fontSize: 19, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
