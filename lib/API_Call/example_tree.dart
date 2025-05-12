import 'dart:convert';
import 'package:e_com_flutter/API_Call/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTree extends StatefulWidget {
  const ExampleTree({super.key});

  @override
  State<ExampleTree> createState() => _ExampleTreeState();
}

class _ExampleTreeState extends State<ExampleTree> {
  List<UserModel> listData = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        listData.add(UserModel.fromJson(i));
      }
      return listData;
    } else {
      return listData;
    }
  }

  var data;

  Future<void> getUserApi1() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("THREE"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi1(),
              builder: (context, AsyncSnapshot<void> snapshot) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name"),
                                Text(data[index]['address']['zipcode']
                                    .toString()),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
