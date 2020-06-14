import 'package:flutter/cupertino.dart';

class RouteOutlineBtnLgSu extends StatefulWidget {

  final String btnText;
  RouteOutlineBtnLgSu({this.btnText});

  @override
  _RouteOutlineBtnLgSuState createState() => _RouteOutlineBtnLgSuState();
}

class _RouteOutlineBtnLgSuState extends State<RouteOutlineBtnLgSu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF222431),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.all(13),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
            color: Color(0xFF222431),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}