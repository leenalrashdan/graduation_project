// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:graduation_project2/Provider/UserProvider.dart';
import 'package:graduation_project2/Controller/authntecation.dart';
import 'package:graduation_project2/model/User.dart';
import 'package:graduation_project2/shared/colors.dart';
import 'package:graduation_project2/shared/showSnackBar.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.data});
  final Map data;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool showMore = true;
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  final addQuantityControllar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    UserProvider userProvider = Provider.of(context, listen: false);
    //userProvider.refreshUser();
    UserDete? userData = userProvider.getUser;

    // showmodel() {
    //   return showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return SimpleDialog(
    //         children: [
    //           SimpleDialogOption(
    //             onPressed: () async {
    //               // Navigator.of(context).pop();
    //             },
    //             padding: EdgeInsets.all(20),
    //             child: Text(
    //               "The quantity you requested is greater than the inventory",
    //               style: TextStyle(
    //                 fontSize: 18,
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Details Item "),
        actions: [
          // AppBarRebited()
        ],
      ),
      body: Padding(
        padding: widthScreen > 600
            ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
            : const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image.asset(widget.prodacts.pathImage),
              Container(
                height: heightScreen - 350,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ClipRRect(
                    child: Image.network(
                      "${widget.data["imgPost"]}",
                      height: 100,
                      // width: 300,
                      fit: BoxFit.cover,
                    ),
                    //  Image.asset("assets/FlatParsley_1400x.webp")

                    borderRadius: BorderRadius.circular(40)),
              ),

              Container(
                height: 600,
                decoration: BoxDecoration(
                  color: scaffoldColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Color.fromARGB(255, 37, 23, 18), width: 2),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              // " \$${widget.prodacts.price}",
                              "Prodact Name: ${widget.data["prodactName"]}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              // " \$${widget.prodacts.price}",
                              " Prodact price:  \$${widget.data["price"]} ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              // " \$${widget.prodacts.price}",
                              " Quantity :  ${widget.data["quntity"]} kg ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10),
                              height: 25,
                              width: 30,
                              child: Text("New"),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 129, 129),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                star1 = true;
                                star2 = false;
                                star3 = false;
                                star4 = false;
                                star5 = false;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.star,
                                color: star1
                                    ? Color.fromARGB(255, 255, 191, 0)
                                    : Colors.white,
                                size: 26,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                star1 = true;
                                star2 = true;
                                star3 = false;
                                star4 = false;
                                star5 = false;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.star,
                                color: star2
                                    ? Color.fromARGB(255, 255, 191, 0)
                                    : Colors.white,
                                size: 26,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                star1 = true;
                                star2 = true;
                                star3 = true;
                                star4 = false;
                                star5 = false;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.star,
                                color: star3
                                    ? Color.fromARGB(255, 255, 191, 0)
                                    : Colors.white,
                                size: 26,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                star1 = true;
                                star2 = true;
                                star3 = true;
                                star4 = true;
                                star5 = false;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.star,
                                color: star4
                                    ? Color.fromARGB(255, 255, 191, 0)
                                    : Colors.white,
                                size: 26,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                star1 = true;
                                star2 = true;
                                star3 = true;
                                star4 = true;
                                star5 = true;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.star,
                                color: star5
                                    ? Color.fromARGB(255, 255, 191, 0)
                                    : Colors.white,
                                size: 26,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.edit_location,
                              color: Color.fromARGB(168, 3, 65, 27),
                              size: 26,
                            ),
                            // Text(widget.prodacts.location),
                            Text(widget.data["title"])
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: Text(
                          "Details : ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 73, 114, 87),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "${widget.data["description"]}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        maxLines: showMore ? 3 : null,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            showMore = !showMore;
                          });
                        },
                        child:
                            showMore ? Text("Show more") : Text("Show less")),
                    TextField(
                        controller: addQuantityControllar,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,

                          hintText: "Add quantity ",
                          prefixIcon: Icon(Icons.production_quantity_limits),
                          // To delete borders
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: BTNgreen,
                            ),
                          ),
                          // fillColor: Colors.red,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    userData!.situation == "Store Owner"
                        ? ElevatedButton(
                            onPressed: () async {
                              if (int.parse(
                                      addQuantityControllar.text.toString()) >
                                  int.parse(widget.data["quntity"])) {
                                showSnackBar(context,
                                    "The quantity you requested is greater than the inventory");
                              } else {
                                await AuthMethods().AddProdactToUserCart(
                                  context: context,
                                  titleee: widget.data["title"],
                                  usernameFarmer: widget.data["username"],
                                  usernameStoreOwner: userData.username,
                                  profileImg: userData.profileImg,
                                  uidFarmer: widget.data["uid"],
                                  prodactName: widget.data["prodactName"],
                                  imgPost: widget.data["imgPost"],
                                  partquntity: addQuantityControllar.text,
                                  price: widget.data["price"],
                                  uidStorOwner: userData.uid,
                                  storeOwnerCheckDelivery: false,
                                  farmerAcceptedRequest: false,
                                  farmerCheckDelivery: false,
                                  postUid: widget.data["postId"],
                                  phoneNumber: widget.data["phoneNumber"],

                                  // FirebaseAuth.instance.currentUser!.uid
                                );
                                Navigator.pop(context);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            child: Text(
                              "Add to Cart ",
                              style: TextStyle(fontSize: 19),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            child: Text(
                              "Go back ",
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
