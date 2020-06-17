import 'package:flutter/material.dart';
import 'package:zielfyp/models/ztodo.dart';
import 'package:zielfyp/screens/home/ztask_form.dart';
import 'package:zielfyp/services/auth.dart';
import 'package:zielfyp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:zielfyp/screens/home/ztodo_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: ZtaskForm(),
            );
          });
    }

    return StreamProvider<List<Ztodo>>.value(
      value: DatabaseService().ztodo,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color(0xFF222431),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: ()async{
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.add_circle_outline),
                label: Text('Add Task'),
            ),
          ],
        ),
        body: ZtodoList(),
      ),
    );
  }
}
