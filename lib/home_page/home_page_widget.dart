import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components/dishitem_widget.dart';
import '../components/help_chat_widget.dart';
import '../components/open_close_widget.dart';
import '../components/toplogomenu_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EachDish{
  final String id;
  final String eventId;
  final String dishCode;
  final String dishname;
  final String productImage;
  final String dishQRCode;
  final String deliverytime;
  final String dishPrice;
  final String dishCost;
  final String dishSpecs;

  const EachDish({required this.id, required this.eventId, required this.dishCode, required this.dishname, required this.productImage, required this.dishQRCode, required this.deliverytime, required this.dishPrice, required this.dishCost, required this.dishSpecs});

  factory EachDish.fromJson(Map<String, dynamic> eachDish){
    return EachDish(id: eachDish["_id"], eventId: eachDish["eventId"], dishCode: eachDish["dish_code"], dishname: eachDish["dish_name"], productImage: eachDish["product_image"], dishQRCode: eachDish["dish_qrode"], deliverytime: eachDish["delivery_time"], dishPrice: eachDish["dish_price"], dishCost: eachDish["dish_cost"], dishSpecs: eachDish["dish_specs"]);
  }
}

class HomeAPIData{
  final bool isError;
  final List<EachDish> data;

  const HomeAPIData({required this.isError, required this.data});

  factory HomeAPIData.fromJson(Map<dynamic, dynamic> jsonData){
    List<Map<String, dynamic>> data = List.from(jsonData['normal']['data'][0]);

    return HomeAPIData(isError: jsonData['normal']['is_error'], data: data.map((e){
      return EachDish.fromJson(e);
    }).toList());
  }
}

Future<HomeAPIData> fetchData()async{
  http.Response res = await http.get(Uri.parse("http://100059.pythonanywhere.com/api/population"));
  if(res.statusCode == 200){
    HomeAPIData data = HomeAPIData.fromJson(await json.decode(res.body));
    return data;
  }else{
    //Handle what happens if the API call fails
    throw Exception('An error occurred');
  }
}

Widget dishesFromAPI(HomeAPIData theData){
  return Column(
    children: theData.data.map((e) => DishitemWidget(image: e.productImage, dishCode: e.dishCode, price: e.dishPrice, qStatus: e.dishQRCode,)).toList(),
  );
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late Future<HomeAPIData> homeApiData;
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    homeApiData = fetchData();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF248B0A),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          toolbarHeight: 0,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<HomeAPIData>(
          future: homeApiData,
          builder: (context, snapShot){
            if(snapShot.hasData){
              return SingleChildScrollView(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: ToplogomenuWidget(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: OpenCloseWidget(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.98,
                        height: MediaQuery.of(context).size.height * 0.58,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                dishesFromAPI(snapShot.data!),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, -0.8),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              2, 2, 2, 2),
                                          child: Container(
                                            width:
                                            MediaQuery.of(context).size.width * 0.9,
                                            height: MediaQuery.of(context).size.height *
                                                0.11,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF2FD106),
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Color(0xFF248B0A),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    FlutterFlowDropDown(
                                                      initialOption: dropDownValue1 ??=
                                                      'All Time',
                                                      options: [
                                                        'All Time',
                                                        'Breakfast',
                                                        'Lunch',
                                                        'Dinner'
                                                      ],
                                                      onChanged: (val) => setState(
                                                              () => dropDownValue1 = val),
                                                      width: 150,
                                                      height: 30,
                                                      textStyle: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Open Sans',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .primaryBackground,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      hintText:
                                                      'Search on menu type...',
                                                      fillColor: Color(0xFF2FD106),
                                                      elevation: 2,
                                                      borderColor: Colors.transparent,
                                                      borderWidth: 0,
                                                      borderRadius: 5,
                                                      margin: EdgeInsetsDirectional
                                                          .fromSTEB(12, 0, 12, 0),
                                                      hidesUnderline: true,
                                                    ),
                                                    FlutterFlowDropDown(
                                                      initialOption: dropDownValue2 ??=
                                                      'Waiting',
                                                      options: [
                                                        'All Orders',
                                                        'Delivered',
                                                        'Waiting'
                                                      ],
                                                      onChanged: (val) => setState(
                                                              () => dropDownValue2 = val),
                                                      width: 120,
                                                      height: 30,
                                                      textStyle: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Open Sans',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .primaryBackground,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      hintText:
                                                      'Search on order type...',
                                                      fillColor: Color(0xFF2FD106),
                                                      elevation: 2,
                                                      borderColor: Colors.transparent,
                                                      borderWidth: 0,
                                                      borderRadius: 5,
                                                      margin: EdgeInsetsDirectional
                                                          .fromSTEB(12, 4, 12, 4),
                                                      hidesUnderline: true,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.9,
                                                      height: 2,
                                                      decoration: BoxDecoration(
                                                        color:
                                                        FlutterFlowTheme.of(context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 4),
                                                      child: FlutterFlowDropDown(
                                                        initialOption:
                                                        dropDownValue3 ??=
                                                        'Phone Number',
                                                        options: [
                                                          'Phone Number',
                                                          'Coupon Code',
                                                          'Dish Code'
                                                        ],
                                                        onChanged: (val) => setState(
                                                                () => dropDownValue3 = val),
                                                        width: 150,
                                                        height: 30,
                                                        textStyle: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Open Sans',
                                                          color: Color(0xF5000000),
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                        hintText:
                                                        'Search on phone/code...',
                                                        fillColor: Color(0xFF2FD106),
                                                        elevation: 2,
                                                        borderColor: Colors.transparent,
                                                        borderWidth: 0,
                                                        borderRadius: 0,
                                                        margin: EdgeInsetsDirectional
                                                            .fromSTEB(12, 0, 12, 0),
                                                        hidesUnderline: true,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: textController,
                                                        onChanged: (_) =>
                                                            EasyDebounce.debounce(
                                                              'textController',
                                                              Duration(milliseconds: 2000),
                                                                  () => setState(() {}),
                                                            ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration: InputDecoration(
                                                          hintText: 'Search Phone/Code',
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText2,
                                                          enabledBorder:
                                                          InputBorder.none,
                                                          focusedBorder:
                                                          InputBorder.none,
                                                          errorBorder: InputBorder.none,
                                                          focusedErrorBorder:
                                                          InputBorder.none,
                                                          contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              15, 0, 0, 10),
                                                        ),
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Open Sans',
                                                          color: Color(0xF5000000),
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 3, 2, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: HelpChatWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }else{
              //What to show incase of an error
              return Center(child: SpinKitChasingDots(
                color: Color(0xFF248B0A),
              ),);
            }
          },
        ),
      ),
    );
  }
}
