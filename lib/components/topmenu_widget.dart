import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopmenuWidget extends StatefulWidget {
  const TopmenuWidget({Key? key}) : super(key: key);

  @override
  _TopmenuWidgetState createState() => _TopmenuWidgetState();
}

class _TopmenuWidgetState extends State<TopmenuWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      height: 2,
      decoration: BoxDecoration(
        color: Color(0xFF248B0A),
      ),
    );
  }
}
