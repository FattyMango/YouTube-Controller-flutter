// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, duplicate_ignore, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube_controller/new/buttons/circle_button.dart';
import 'package:youtube_controller/new/misc/colors.dart';

import '../../utils/utils.dart';

class CircleController extends StatefulWidget {
  dynamic currentVideoStatus;
  String IpAddress;
  final void Function(dynamic) setResponse;
   CircleController({super.key,required this.currentVideoStatus, required this.IpAddress, required this.setResponse});

  @override
  State<CircleController> createState() => _CircleControllerState();
}

dynamic build_circle() {
  return List.generate(9, (index) {
    if (index < 3) {
      if (index == 1)
        // ignore: prefer_const_constructors
        return Padding(
          padding: const EdgeInsets.only(right: 50),
          child: CircleButton(),
        );
      else
        return CircleButton();
    }
    // else if (index > 5) {
    // }
    else
      return CircleButton();
  });
}

class _CircleControllerState extends State<CircleController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 400,
      constraints: BoxConstraints(
          maxWidth: 370, maxHeight: 370, minWidth: 150, minHeight: 150),
      decoration: BoxDecoration(
          color: AppColors.mainWidgetColor,
          borderRadius: BorderRadius.circular(300)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 40),
                  child: CircleButton(
                    icon: Icons.volume_up_outlined,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: CircleButton(icon: Icons.refresh,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 40),
                  child: CircleButton(
                    icon: Icons.play_circle_outline_sharp,
                    iconColor:widget.currentVideoStatus['auto_play']==true? AppColors.buttonClicked : Colors.black.withOpacity(0.8) ,
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () async{
              var response = await send_command(deviceName: 'Samsung A70',command: '17',ADDRESS: widget.IpAddress);
              // print( response.runtimeType);
              // Map<dynamic, dynamic> map = jsonDecode(response)as Map<dynamic, dynamic>;
              print(response.runtimeType);

              // debugPrint(response, wrapWidth: 1024);
              
              
              widget.setResponse(response);
            },
                    child: CircleButton(
                      icon: widget.currentVideoStatus['muted']==true?Icons.volume_off_outlined : Icons.volume_mute,
                    iconColor:widget.currentVideoStatus['muted']==true? AppColors.buttonClicked : Colors.black.withOpacity(0.8)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 0,
                  ),
                  child: CircleButton(
                    size: 100,
                    icon: Icons.home_outlined,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: CircleButton(
                    icon: Icons.watch_later_outlined,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, bottom: 40),
                  child: CircleButton(
                    icon: Icons.volume_down_outlined,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: () async{
              var response = await send_command(deviceName: 'Samsung A70',command: '12',ADDRESS: widget.IpAddress);
              // print( response.runtimeType);
              // Map<dynamic, dynamic> map = jsonDecode(response)as Map<dynamic, dynamic>;
              print(response.runtimeType);

              // debugPrint(response, wrapWidth: 1024);
              
              
              widget.setResponse(response);
            },
                    child : CircleButton(
                    icon: widget.currentVideoStatus['subtitle_available']==true?Icons.subtitles_outlined:Icons.subtitles_off_outlined,
                    iconColor: widget.currentVideoStatus['subtitle_available']==true? widget.currentVideoStatus['subtitle_pressed']?AppColors.buttonClicked : Colors.black.withOpacity(0.8):Colors.black.withOpacity(0.8),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, bottom: 40),
                  child: CircleButton(
                    icon: widget.currentVideoStatus['full_screen']==true?Icons.fullscreen_exit : Icons.fullscreen_sharp,
                    iconColor: widget.currentVideoStatus['full_screen']==true?AppColors.buttonClicked : Colors.black.withOpacity(0.8)
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
