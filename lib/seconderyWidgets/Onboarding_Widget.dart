// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:graduation_project2/seconderyWidgets//Onboarding_Widget_2.dart';
import 'package:graduation_project2/shared/colors.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingWidget2()),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 790,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/onboarding_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              height: 400,
                            ),
                            const Text(
                              'Fresh Vegetables and Fruits',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 240,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 100,
                                    ),
                                    backgroundColor: appbarGreen,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OnboardingWidget2()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.navigate_before,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
