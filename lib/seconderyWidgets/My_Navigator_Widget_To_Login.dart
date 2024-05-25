// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:graduation_project2/pages/Login.dart';
import 'package:graduation_project2/shared/colors.dart';

class MyNavigatorWidget extends StatefulWidget {
  const MyNavigatorWidget({super.key});

  @override
  _MyNavigatorWidgetState createState() => _MyNavigatorWidgetState();
}

class _MyNavigatorWidgetState extends State<MyNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: const Text("Sign in"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
          child: Center(
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'This account doesn\'t exist',
                    style: TextStyle(fontSize: 19),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        // context,
                        // MaterialPageRoute(
                        //   builder: (context) => MyResponsiveWidget(),
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: BTNgreen),
                    child: const Text(
                      'Back To Login Page',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyResponsiveWidget extends StatelessWidget {
  const MyResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Responsive Widget'),
      ),
    );
  }
}
