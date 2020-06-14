import 'package:flutter/cupertino.dart';

class OutlineBtn extends StatefulWidget {

  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
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