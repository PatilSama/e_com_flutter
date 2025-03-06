import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension SizedBoxExtension on num {
  // Extension for creating a SizedBox with height
  SizedBox get h => SizedBox(height: toDouble(),);

  // Extension for creating a SizedBox with width
  SizedBox get w => SizedBox(width: toDouble());
}

extension SizedBoxExtensions on num {
  // Extension for creating a Container with height and color
  Container ht({Color color = Colors.blue}) {
    return Container(
      height: toDouble(),
      color: color, // Custom color
    );
  }

  // Extension for creating a SizedBox with width
  SizedBox get wd => SizedBox(width: toDouble());
}
