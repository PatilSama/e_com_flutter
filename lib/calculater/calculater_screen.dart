import 'package:flutter/material.dart';

class CalculaterScreen extends StatefulWidget {
  const CalculaterScreen({super.key});

  @override
  State<CalculaterScreen> createState() => _CalculaterScreenState();
}

class _CalculaterScreenState extends State<CalculaterScreen> {
  int output = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          "Calculator App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              output.toString(),
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Column(children: [Row(children: [
            
          ],)],)
        ],
      ),
    );
  }
}
