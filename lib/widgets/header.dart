import 'package:digitalq/constants/colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String? PageType;
 Header({super.key,required this.PageType});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Testing Mode / Learning Mode / Archived Data",
            style: TextStyle(color: warningRed, fontStyle: FontStyle.italic),
          ),
        ],
      ),
      Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: mainGreen, width: 2.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(PageType!,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 19,
                    color: Colors.grey[700])),
            Row(
              children: [
                Image.asset(
                  "assets/images/person_man.png",
                  height: 16,
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/digitalq_icon.PNG",
                  height: 26,
                )
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
