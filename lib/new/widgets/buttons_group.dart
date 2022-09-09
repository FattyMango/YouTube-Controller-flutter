// ignore_for_file: avoid_unnecessary_containers, avoid_print, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:youtube_controller/new/buttons/circle_button.dart';
import 'package:youtube_controller/new/buttons/quality_options.dart';
import 'package:youtube_controller/new/buttons/rectangle_button.dart';

class ButtonsGroup extends StatefulWidget {
  const ButtonsGroup({super.key});

  @override
  State<ButtonsGroup> createState() => _ButtonsGroupState();
}

class _ButtonsGroupState extends State<ButtonsGroup> {
  bool pressedQuality = false;
  void onQualityOptionsPressed() {
    setState(() {
      pressedQuality = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          pressedQuality
              ? QualityOptions(
                  pressedQuality: pressedQuality,
                  onQualityOptionsPressed: onQualityOptionsPressed,
                )
              : Container(),
          SizedBox(
            height: pressedQuality ? 10 : 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onLongPressStart: (deails) {
                      print('start');
                      setState(() {
                        pressedQuality = true;
                      });
                    },
                    onTap: () {
                      setState(() {
                        pressedQuality = false;
                      });
                    },
                    child: RectangleButton(icon: Icons.settings_outlined,)),
                RectangleButton(icon: Icons.slow_motion_video_outlined )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RectangleButton(
                  icon: Icons.skip_previous_outlined,
                ),
                RectangleButton(icon: Icons.skip_next_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
