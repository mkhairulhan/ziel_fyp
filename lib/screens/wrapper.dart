import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zielfyp/models/user.dart';
import 'package:zielfyp/screens/authenticate/loginuser.dart';
import 'package:zielfyp/screens/home/home.dart';

import 'authenticate/login.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final user = Provider.of<User>(context);

    //return either Home or Authenticate widget
    if(user == null){
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
      );
    }else{
      return Home();
    }
  }
}