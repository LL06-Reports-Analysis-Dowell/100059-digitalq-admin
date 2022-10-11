import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class FeaturesDigitalqWidget extends StatefulWidget {
  const FeaturesDigitalqWidget({Key? key}) : super(key: key);

  @override
  _FeaturesDigitalqWidgetState createState() => _FeaturesDigitalqWidgetState();
}

class _FeaturesDigitalqWidgetState extends State<FeaturesDigitalqWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFC0303),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: FaIcon(
            FontAwesomeIcons.home,
            color: Color(0xFFF18A8A),
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('HomePage');
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
            child: Text(
              'UX Living Lab Sales Agent',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Open Sans',
                    color: Color(0xFFF18A8A),
                    fontSize: 16,
                  ),
            ),
          ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.solidWindowClose,
              color: Color(0xFFF18A8A),
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: FlutterFlowSwipeableStack(
                topCardHeightFraction: 0.72,
                middleCardHeightFraction: 0.68,
                botttomCardHeightFraction: 0.75,
                topCardWidthFraction: 0.9,
                middleCardWidthFraction: 0.85,
                botttomCardWidthFraction: 0.8,
                onSwipeFn: (index) {},
                onLeftSwipe: (index) {},
                onRightSwipe: (index) async {
                  context.pushNamed('HomePage');
                },
                onUpSwipe: (index) {},
                onDownSwipe: (index) {},
                itemBuilder: (context, index) {
                  return [
                    () => Image.asset(
                          'assets/images/Playstore_logo_(4).png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                    () => Image.asset(
                          'assets/images/9hsjc_2.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                    () => Image.asset(
                          'assets/images/artistic_logo.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                  ][index]();
                },
                itemCount: 3,
                controller: swipeableStackController,
                enableSwipeUp: false,
                enableSwipeDown: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
