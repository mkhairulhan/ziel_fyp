import 'package:flutter/material.dart';
import 'package:zielfyp/models/ztodo.dart';

class ZtodoTile extends StatelessWidget {

  final Ztodo ztodo;
  ZtodoTile({this.ztodo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red[ztodo.taskPriority],
          ),
          title: Text(ztodo.taskName),
          subtitle: Text('Created by: ${ztodo.taskAuthor}'),
        ),
      ),
    );
  }
}
