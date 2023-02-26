import 'package:flutter/material.dart';

class BackgroundLoginRegister extends StatelessWidget {
  const BackgroundLoginRegister({Key? key, required this.content}) : super(key: key);

  final Widget content ;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Color(0xff303837),
            Color(0xff827256),
            Color(0xfffde8bc),
            Color(0xfffff0ca),
            ],
    )
    ),
        child: content,
    );
  }
}
