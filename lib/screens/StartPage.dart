import 'package:digitalq/constants/colors.dart';
import 'package:digitalq/screens/HomeScreen.dart';
import 'package:digitalq/screens/StartPage2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.off(HomePage());
                    },
                    child: Image.asset(
                      "assets/images/digitalq_icon.PNG",
                      scale: 1,
                    ),
                  ),
                  Container(
                    width: 85,
                    child: Text(
                      "Digital Q Manager",
                      style: TextStyle(
                          color: mainGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}