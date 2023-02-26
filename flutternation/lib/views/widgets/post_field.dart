import 'package:flutter/material.dart';

class PostField extends StatelessWidget {
  const PostField({Key? key, required this.hintText,  required this.controller}) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color : Colors.grey[100],
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        maxLines: 2,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0
            )
        ),
      ),
    );
  }
}
