import 'package:flutter/material.dart';
import 'package:zielfyp/shared/constants.dart';
import 'package:zielfyp/models/ztodo.dart';

class ZtaskForm extends StatefulWidget {
  @override
  _ZtaskFormState createState() => _ZtaskFormState();
}

class _ZtaskFormState extends State<ZtaskForm> {

  final _formKey = GlobalKey<FormState>();
  List<String> authorsZ = ['Personal', 'Work', 'Leisure'];

  //form values
  String _currenttaskName;
  String _currenttaskAuthor;
  int _currenttaskPriority;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update Task',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, top: 15, right: 15, bottom: 15),
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Color(0xFF222431),
                  width: 2.5,
                ),
              ),
              hintText: "Task Name",
            ),
            validator: (val) => val.isEmpty ? 'Please enter task' : null,
            onChanged: (val) => setState(() => _currenttaskName = val),
          ),
          SizedBox(height: 20,),
          //dropdown
          DropdownButtonFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, top: 15, right: 15, bottom: 15),
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Color(0xFF222431),
                  width: 2.5,
                ),
              ),
              hintText: "Category",
            ),
            items: authorsZ.map((taskAuthor){
              return DropdownMenuItem(
                value: taskAuthor,
                child: Text('$taskAuthor category'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currenttaskAuthor = val),
          ),
          SizedBox(height: 20,),
          //slider
          Slider(
            value: (_currenttaskPriority ?? 100).toDouble(),
            activeColor: Colors.red[_currenttaskPriority ?? 100],
            inactiveColor: Colors.red[_currenttaskPriority ?? 100],
            min: 100,
            max: 900,
            divisions: 2,
            onChanged: (val) => setState(() => _currenttaskPriority = val.round()),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () async{
              print(_currenttaskName);
              print(_currenttaskAuthor);
              print(_currenttaskPriority);
            },
            color: Color(0xFF222431),
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}