import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zielfyp/models/ztodo.dart';
import 'package:zielfyp/screens/home/ztodo_tile.dart';

class ZtodoList extends StatefulWidget {
  @override
  _ZtodoListState createState() => _ZtodoListState();
}

class _ZtodoListState extends State<ZtodoList> {
  @override
  Widget build(BuildContext context) {

    final ztodos = Provider.of<List<Ztodo>>(context);

    return ListView.builder(
      itemCount: ztodos.length,
      itemBuilder: (context, index){
        return ZtodoTile(ztodo: ztodos[index]);
      },
    );
  }
}
