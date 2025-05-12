import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiHelper {
  static customTextField(
      {required TextEditingController controller,
      required String text,
      required bool toHide,
      TextInputType? textInputType}) {
    return Container(
      width: 343,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFF121212),
          border: Border.all(color: Colors.white24)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextField(
          controller: controller,
          obscureText: toHide,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  static customImage({required String imageUrl}) {
    return Image.asset(imageUrl);
  }

  static customTextButton(
      {required String text, required VoidCallback callback}) {
    return TextButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xFF3797EF),
        ),
      ),
    );
  }

  static Widget customButton({
    required VoidCallback callback,
    required String buttonName,
  }) {
    return SizedBox(
      height: 50,
      width: 343,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3797EF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            minimumSize: Size(double.infinity, double.infinity),
            padding: EdgeInsets.zero,
          ),

          onPressed: callback,
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }

}
