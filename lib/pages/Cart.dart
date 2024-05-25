// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls, file_names

import 'package:flutter/material.dart';
import 'package:graduation_project2/Controller/CartController.dart';
import 'package:graduation_project2/shared/colors.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 76, 141, 95),
          title: Text("Cart  "),
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
                          margin: EdgeInsets.only(bottom: 20),
                          child: CartController().StreamBuilderCart(context,
                              uid: "uidStorOwner", collectionn: "cartSSS")),
                      ElevatedButton(
                        onPressed: () async {
                          CartController()
                              .sendProdactToFarmer(context: context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BTNgreen),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        child: Text(
                          "Send Order To farmer ",
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
