import 'package:flutter/material.dart';
class ClipPathDesign extends StatefulWidget {
  const ClipPathDesign({super.key});

  @override
  State<ClipPathDesign> createState() => _ClipPathDesignState();
}

class _ClipPathDesignState extends State<ClipPathDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: TringleClipper(),
          child: Container(color: Colors.orange,height: 300,width: 300,),
        ),
      ),
    );
  }
}

class TringleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.moveTo(size.width/2, 0);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width/2, size.height);
    // path.lineTo(size.width/5, size.height);
    // path.moveTo(size.width, size.height);


    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}