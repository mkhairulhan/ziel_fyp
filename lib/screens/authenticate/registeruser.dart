import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zielfyp/services/auth.dart';

class RegisterUser extends StatefulWidget {

  final IconData icon;
  final String hint;
  final String btnText;
  RegisterUser({this.icon, this.hint, this.btnText});

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 40,
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Color(0xFF222431),
                    ),
                    SizedBox(height: 20,),
                    Icon(
                      Icons.vpn_key,
                      size: 20,
                      color: Color(0xFF222431),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val){
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20, top: 15, right: 15, bottom: 15),
//                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color(0xFF222431),
                            width: 2.5,
                          ),
                        ),
                        hintText: "Enter Email",
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      obscureText: true,
                      onChanged: (val){
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20, top: 15, right: 0, bottom: 15),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color(0xFF222431),
                            width: 2.5,
                          ),
                        ),
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 100,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50,),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () async{
                print(email);
                print(password);
              },
              color: Color(0xFF222431),
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  widget.btnText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
