import 'package:digitalq/constants/colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/digitalq_icon.PNG",
                        scale: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("DoWell",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 19,
                              fontWeight: FontWeight.bold)),
                      Text("Digital Q Manager",
                          style: TextStyle(
                              color: mainGreen,
                              fontSize: 19,
                              fontWeight: FontWeight.bold)),
                    ], 
                  ),
               ],
              ),
            ],
          ),
        ],
      ),
    );
  } 
}
