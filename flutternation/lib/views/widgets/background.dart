import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.content}) : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // gradient background
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff53c5f9),
                  Colors.white,

                  //Color(0xff32272e),
                  //Color(0xff0c1623)
                ],
              )
          ),
          child: SingleChildScrollView(
              child: content
          ),
        ),

      ]
    );
  }
}
