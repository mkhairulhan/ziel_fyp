import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:zielfyp/screens/authenticate/inputwithicon.dart';
import 'package:zielfyp/screens/authenticate/outlinebuttonlogin.dart';
import 'package:zielfyp/screens/authenticate/registeruser.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFF222431);
  var _getstartButtonColor = Color(0xFF222431);
  var _getstartTextColor = Colors.white;

  double _headingTop = 110;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 260;
    _registerHeight = windowHeight - 260;

    switch(_pageState){
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFF222431);
        _getstartButtonColor = Color(0xFF222431);
        _getstartTextColor = Colors.white;

        _headingTop = 110;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 260;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFF222431);
        _headingColor = Colors.white;
        _getstartButtonColor = Colors.white;
        _getstartTextColor = Color(0xFF222431);
        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 260;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 260;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFF222431);
        _headingColor = Colors.white;
        _getstartButtonColor = Colors.white;
        _getstartTextColor = Color(0xFF222431);

        _headingTop = 90;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 260;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 260;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 260;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: _headingTop,
                        ),
                        child: Text(
                          "Ziel",
                          style: TextStyle(
                            color: _headingColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 25,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 70,),
                        child: Text(
                          "A clean to-do app. Made for the pros.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _headingColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Center(
                  child: Image.asset("assets/images/Asset2.png"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){setState(() {
                      if(_pageState != 0){
                        _pageState = 0;
                      }else{
                        _pageState = 1;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _getstartButtonColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: _getstartTextColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InputWithIcon(
                    btnText: "Login",
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50,),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlineBtn(
                        btnText: "Create New Account",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(//
          height: _registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(//
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[//
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create A New Account",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  RegisterUser(//
                    btnText: "Create Account",
                  ),
                ],
              ),
              Column(//
                children: <Widget>[//
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _pageState = 1;
                        });
                      },
                      child: OutlineBtn(
                        btnText: "Login",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}