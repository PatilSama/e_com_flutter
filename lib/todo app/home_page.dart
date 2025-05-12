import 'package:e_com_flutter/todo%20app/database/database.dart';
import 'package:e_com_flutter/todo%20app/utils/dialog_box.dart';
import 'package:e_com_flutter/todo%20app/utils/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  // List todoList = [
  //   ["TODO", false],
  //   ["TODO", false],
  //   ["TODO", false],
  //   ["TODO", false]
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_myBox.get("TODOLIST") == null) {
      db.createData();
    } else {
      db.loadData();
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      print(value);
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              onSave: () => saveNewTask(),
              onCancel: () => Navigator.of(context).pop(),
              controller: _controller);
        });
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("TODO"),
        backgroundColor: Colors.deepPurple[400],
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.deepPurple[400],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
                isChecked: db.todoList[index][1],
                todoText: db.todoList[index][0],
                onChanged: (value) => checkBoxChanged(value, index),
                onPressed: (context) => deleteTask(index));
          }),
    );
  }
}
