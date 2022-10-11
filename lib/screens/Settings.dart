import 'package:digitalq/constants/colors.dart';
import 'package:digitalq/controllers/RadioController.dart';
import 'package:digitalq/widgets/HomeNavigator.dart';
import 'package:digitalq/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:material_color_generator/material_color_generator.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  RadioController radioController = Get.put(RadioController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: greenShade1,
        bottomNavigationBar: HomeNavigator(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              Header(PageType: "Settings"),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Enter Brand Name",
                        style: TextStyle(
                          color: Colors.grey[700],
                        )),
                    Row(
                      children: [
                        const Text("Industry", style: TextStyle(fontSize: 10)),
                        const SizedBox(
                          width: 1,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 50,
                          color: Colors.grey[500],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Column(
                  children: [
                    Text(
                      "Enter Branch Names, Country, City",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      " latitude & longitude, currency ",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter Delivery types",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Takeaway",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[700]))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Dine-in",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[700]))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Home delivery",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[700]))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter Menu types",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Break fast Menu",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Dinner Menu",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Lunch Menu",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("All Day Menu",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery Counters",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 13,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: warningRed,
                                      size: 16,
                                    ),
                                    Text("1",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: warningRed,
                                      size: 16,
                                    ),
                                    Text("2",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: warningRed,
                                      size: 16,
                                    ),
                                    Text("3",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: warningRed,
                                      size: 16,
                                    ),
                                    Text("4",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: warningRed,
                                      size: 16,
                                    ),
                                    Text("5",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "CommonQ",
                                  groupValue: "group value",
                                  onChanged: (value) {
                                    radioController.commonQ;
                                  }),
                              Text("Common Q", style: TextStyle(fontSize: 10))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "CommonQ",
                                  groupValue: "group value",
                                  onChanged: (value) {
                                    radioController.commonQ;
                                  }),
                              Text(
                                "Counter Q",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: greyShade,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: greyShade,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Repeat Menu",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "CommonQ",
                                  groupValue: "group value",
                                  onChanged: (value) {}),
                              Text("Every Day", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "CommonQ",
                                  groupValue: "group value",
                                  onChanged: (value) {
                                    radioController.commonQ;
                                  }),
                              Text("No repeat")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: greyShade,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: greyShade,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select your theme",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 30,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: mainGreen,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("")),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 30,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: greenShade2,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("")),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 30,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: greenShade1,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("")),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                          onTap: () {
                            colorPicker(context);
                          },
                          child: Image.asset("assets/images/colorpicker.PNG"))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select Language options for Customer",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("English",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Thai",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Chinese",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: warningRed,
                                size: 16,
                              ),
                              Text("Japanese",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[900]))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: mainGreen,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: mainGreen,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select Payment options to connect",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Image.asset(
                                "assets/images/picture_list.PNG",
                              ))
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: warningRed,
                                  size: 16,
                                ),
                                Text("Scan Qr Code",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.grey[700]))
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: warningRed,
                                  size: 16,
                                ),
                                Text("Cash Counter",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.grey[700]))
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: warningRed,
                                  size: 16,
                                ),
                                Text("Pay online",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.grey[700]))
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: warningRed,
                                  size: 16,
                                ),
                                Text("Payment App",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.grey[700]))
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: warningRed,
                                  size: 16,
                                ),
                                Text("Payment By membership",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.grey[700]))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 10, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      left: BorderSide(
                        color: greyShade,
                        width: 4,
                      ),
                      right: BorderSide(
                        color: greyShade,
                        width: 4,
                      )),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Repeat Menu",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "CommonQ",
                                  groupValue: "group value",
                                  onChanged: (value) {}),
                              Text("Every Day", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "CommonQ",
                                  groupValue: "group value",
                                  onChanged: (value) {
                                    radioController.commonQ;
                                  }),
                              Text("No repeat")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  padding: EdgeInsets.only(left: 10, right: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          left: BorderSide(
                            color: mainGreen,
                            width: 4,
                          ),
                          right: BorderSide(
                            color: mainGreen,
                            width: 4,
                          ))),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/digitalq_icon.PNG",
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Logo", style: TextStyle(fontSize: 10)),
                              SizedBox(height: 5),
                              Text("uploaded", style: TextStyle(fontSize: 10))
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: greenShade2,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(children: [
                              Text("Upload New",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                              SizedBox(height: 5),
                              Text("(enable after subscription)",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10))
                            ])),
                      )
                    ],
                  )),
              SizedBox(height: 5),
              Container(
                  padding: EdgeInsets.only(left: 10, right: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          left: BorderSide(
                            color: mainGreen,
                            width: 4,
                          ),
                          right: BorderSide(
                            color: mainGreen,
                            width: 4,
                          ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/qrcode.PNG",
                        width: 50,
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Home page link (landing page)",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: greenShade2,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text("Download QR code",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))),
                              SizedBox(width: 2),
                              Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: greenShade2,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text("Copy link",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))),
                              SizedBox(width: 2),
                              Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: greenShade2,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text("Create new",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))),
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

Future colorPicker(BuildContext context) {
  RadioController radioController = Get.put(RadioController());
  return showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
            title: new Text('Pick a color'),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            content: new ColorPicker(
                pickerColor: Colors.blue,
                onColorChanged: (value) {
                  value == radioController.currentColor;
                  print(radioController.currentColor);
                }),
          ));
}
