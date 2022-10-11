import 'package:digitalq/constants/colors.dart';
import 'package:digitalq/widgets/HomeNavigator.dart';
import 'package:digitalq/widgets/header.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class PrepareDish extends StatelessWidget {
  const PrepareDish({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Header(PageType: "Prepare Dish"),
              SizedBox(
                height: 15,
              ),
              Text(
                "New Dish",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: EdgeInsets.only(left: 15, right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenShade1,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text("Product List",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Tea", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Coffee", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Ice Cream", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 1,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greenShade1),
                      child: Stack(
                        children: [
                          Positioned(
                              left: 40,
                              bottom: 0,
                              child: Icon(Icons.arrow_back_sharp)),
                          Column(
                            children: [
                              Text("Selected Products",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("Ice Cream",
                                      style: TextStyle(fontSize: 20)),
                                  Column(
                                    children: [
                                      Icon(Icons.keyboard_arrow_up),
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("Pineapple",
                                      style: TextStyle(fontSize: 20)),
                                  Column(
                                    children: [
                                      Icon(Icons.keyboard_arrow_up),
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
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
