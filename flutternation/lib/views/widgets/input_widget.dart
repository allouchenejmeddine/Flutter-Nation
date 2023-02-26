import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({Key? key, required this.hintText, required this.controller, required this.obscureText, required this.maxLength, required this.icon}) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final int maxLength;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      maxLines: 1,
      obscureText: obscureText,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, size:20),
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.brown[700]
          ),
          alignLabelWithHint: true,
          filled: true,
          fillColor: Colors.yellow[50],
          border: InputBorder.none
      ),
    );
  }
}


