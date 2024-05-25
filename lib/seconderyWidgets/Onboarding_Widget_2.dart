// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project2/pages/Login.dart';
import 'package:graduation_project2/shared/colors.dart';

class OnboardingWidget2 extends StatelessWidget {
  const OnboardingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        },
        child: Container(
          height: 790,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/onboarding_image2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 240,
                  ),
                  const Text(
                    'Delivered to your doorstep!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 280,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            backgroundColor: appbarGreen),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        icon: const Icon(
                          Icons.navigate_before,
                          color: Colors.white,
                        ),
                        label: const Text(
                          '! Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
