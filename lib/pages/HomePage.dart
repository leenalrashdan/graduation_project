// ignore_for_file: file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project2/Provider/Notifecation.dart';
import 'package:graduation_project2/Provider/Req.dart';
import 'package:graduation_project2/Provider/UserProvider.dart';
import 'package:graduation_project2/Controller/fireStore.dart';
import 'package:graduation_project2/model/User.dart';
import 'package:graduation_project2/pages/Cart.dart';
import 'package:graduation_project2/pages/Login.dart';
import 'package:graduation_project2/pages/ProfileFarmer.dart';
import 'package:graduation_project2/pages/ProfileStore.dart';
import 'package:graduation_project2/pages/RequstedProdactFarmer.dart';
import 'package:graduation_project2/pages/notifStoreOwner.dart';
import 'package:graduation_project2/shared/PostDesign.dart';
import 'package:graduation_project2/shared/colors.dart';
import 'package:graduation_project2/shared/showSnackBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> userDate = {};

  bool isLoading = true;
  bool fruitProdact = false;
  bool vegetableProdact = false;
  bool anotherProdact = false;

  @override
  void initState() {
    super.initState();
    fruitProdact = false;
    vegetableProdact = false;
    anotherProdact = false;
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

    final searchController = TextEditingController();

    UserProvider userProvider = Provider.of(context, listen: false);

    UserDete? userData = userProvider.getUser;

    final classInstancee = Provider.of<Notificationn>(context);
    final reqProvider = Provider.of<RequstedProvider>(context);

    int counter = classInstancee.getCount();
    reqProvider.getCountREQ();

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: appbarGreen,
        actions: [
          Stack(children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => userData?.situation == "Farmer"
                        ? const RequsteProdact()
                        : const NotifayStoreOwner(),
                  ),
                );
              },
              icon: const Icon(Icons.notification_important_rounded,
                  color: Colors.green),
            ),
            Positioned(
              left: 11,
              top: 11,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  userData?.situation == "Farmer"
                      ? '${reqProvider.getCountREQ()}'
                      : '$counter',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
          CircleAvatar(
            backgroundImage: NetworkImage(userData!.profileImg),
          ),
          const SizedBox(width: 12),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(userData.profileImg),
                    ),
                  ),
                  accountName: Text(
                    userData.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  accountEmail: Text(
                    userData.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 53, 137, 78),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black45,
                        BlendMode.darken,
                      ),
                      image: AssetImage(
                        "assets/nathan-dumlao-bRdRUUtbxO0-unsplash-1536x1024.jpeg",
                      ),
                    ),
                  ),
                ),
                _createDrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
                _createDrawerItem(
                  icon: Icons.add_shopping_cart,
                  text: 'My products',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => userData.situation == "Farmer"
                            ? const RequsteProdact()
                            : const Cart(),
                      ),
                    );
                  },
                ),
                _createDrawerItem(
                  icon: Icons.person,
                  text: 'Profile Page',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => userData.situation == "Farmer"
                            ? const ProfileFarmer()
                            : const ProfileStoreOwner(),
                      ),
                    );
                  },
                ),
                _createDrawerItem(
                  icon: Icons.help_center,
                  text: 'About',
                  onTap: () {},
                ),
                _createDrawerItem(
                  icon: Icons.exit_to_app,
                  text: 'Logout',
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Developed by Omar Essam Quraan ",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.copyright,
                    size: 15,
                  ),
                  Text(
                    "2024",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: widthScreen > 600
            ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
            : const EdgeInsets.all(0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/annie-spratt-m1t-RJ1iCIU-unsplash.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    const Positioned(
                      bottom: 100,
                      left: 50,
                      child: Text(
                        "Welcome ....",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 40,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: "Search...",
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: BTNgreen),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: contantPost,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _createCategoryButton(
                      label: 'Fruits',
                      selected: fruitProdact,
                      onTap: () {
                        setState(() {
                          fruitProdact = true;
                          vegetableProdact = false;
                          anotherProdact = false;
                        });
                      },
                    ),
                    _createCategoryButton(
                      label: 'Vegetables',
                      selected: vegetableProdact,
                      onTap: () {
                        setState(() {
                          fruitProdact = false;
                          vegetableProdact = true;
                          anotherProdact = false;
                        });
                      },
                    ),
                    _createCategoryButton(
                      label: 'Others',
                      selected: anotherProdact,
                      onTap: () {
                        setState(() {
                          fruitProdact = false;
                          vegetableProdact = false;
                          anotherProdact = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              sliver: StreamBuilder<QuerySnapshot>(
                stream: FireBase().getDataBasedTypeProdact(
                  fruit: fruitProdact,
                  vegetable: vegetableProdact,
                  another: anotherProdact,
                ),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: showSnackBar(context, "Something went wrong"),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return PostDesign(data: data);
                      },
                      childCount: snapshot.data!.docs.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      leading: Icon(icon, color: Colors.green),
      onTap: onTap,
    );
  }

  TextButton _createCategoryButton(
      {required String label,
      required bool selected,
      required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          selected ? Colors.white : Colors.black,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          selected ? Colors.green : Colors.transparent,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.green),
          ),
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}
