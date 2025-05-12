import 'package:flutter/material.dart';

class BottomAnim extends StatefulWidget {
  const BottomAnim({super.key});

  @override
  State<BottomAnim> createState() => _BottomAnimState();
}

class _BottomAnimState extends State<BottomAnim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Row(children: [],),
        ),
      ),
    );
  }
}
