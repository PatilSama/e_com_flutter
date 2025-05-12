import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{

  List todoList = [];

  final _myBox = Hive.box('mybox');

  void createData(){
    todoList = [
      ["TODO", false],
    ];
  }

  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase(){
    _myBox.put("TODOLIST", todoList);
  }

}