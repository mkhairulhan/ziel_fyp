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
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50,),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() => error = 'Please supply a valid credentials.');
                      }
                    }
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
                SizedBox(height: 20,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
