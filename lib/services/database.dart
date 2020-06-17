import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zielfyp/models/ztodo.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference todoCollection = Firestore.instance.collection('todo');

  Future updateUserData(String taskName, String taskAuthor, int taskPriority) async {
    return await todoCollection.document(uid).setData({
      'Task': taskName,
      'Author': taskAuthor,
      'Priority': taskPriority,
    });
  }

  //ztodo list from snapshot
  List<Ztodo> _ztodoListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Ztodo(
        taskName: doc.data['Task'] ?? '',
        taskAuthor: doc.data['Author'] ?? '',
        taskPriority: doc.data['Priority'] ?? 0,
      );
    }).toList();
  }

  //get to-do stream
  Stream<List<Ztodo>> get ztodo {
    return todoCollection.snapshots().map(_ztodoListFromSnapshot);
  }
}