// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';


import 'circle_button.dart';

// ignore: must_be_immutable
class QualityOptions extends StatefulWidget {
  bool pressedQuality;
  final void Function() onQualityOptionsPressed;
  QualityOptions(
      {super.key,
      required this.pressedQuality,
      required this.onQualityOptionsPressed});

  @override
  State<QualityOptions> createState() => _QualityOptionsState();
}

class _QualityOptionsState extends State<QualityOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              print("1");
              widget.onQualityOptionsPressed();
            },
            child: CircleButton(
              size: 50,
              icon: Icons.high_quality_sharp,
            )),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              print("2");
              widget.onQualityOptionsPressed();
            },
            child: CircleButton(
              size: 50,
              icon: Icons.zoom_out
            )),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              print("3");
              widget.onQualityOptionsPressed();
            },
            child: CircleButton(
              size: 50,
              icon: Icons.hdr_auto_sharp,
            )),
      ],
    );
  }
}
