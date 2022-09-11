// ignore_for_file: avoid_unnecessary_containers, avoid_print, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:youtube_controller/new/buttons/circle_button.dart';
import 'package:youtube_controller/new/buttons/quality_options.dart';
import 'package:youtube_controller/new/buttons/rectangle_button.dart';

import '../../utils/utils.dart';

class ButtonsGroup extends StatefulWidget {
  String IpAddress;
  final void Function(dynamic) setResponse;
  ButtonsGroup({super.key, required this.setResponse, required this.IpAddress});

  @override
  State<ButtonsGroup> createState() => _ButtonsGroupState();
}

class _ButtonsGroupState extends State<ButtonsGroup> {
  bool pressedQuality = false;
  bool playBackSpeedQuality = false;
  void onQualityOptionsPressed() {
    setState(() {
      pressedQuality = false;
      playBackSpeedQuality = false;
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

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () async{
                      var response = send_command(deviceName: 'Samsung A70',command: '51',option: '3',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
                  onVerticalDragEnd: (details)async {
                    if(details.velocity.pixelsPerSecond.dy<0){
                      var response = await send_command(deviceName: 'Samsung A70',command: '51',option: '1',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);}
                    
                    if(details.velocity.pixelsPerSecond.dy>0){
                      var response = await send_command(deviceName: 'Samsung A70',command: '51',option: '2',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);}
                    },

                    child: RectangleButton(
                      icon: Icons.settings_outlined,
                    )),
                GestureDetector(
                  onVerticalDragEnd: (details)async {
                    if(details.velocity.pixelsPerSecond.dy<0){
                      var response = await send_command(deviceName: 'Samsung A70',command: '28',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    }
                    if(details.velocity.pixelsPerSecond.dy>0){
                      var response = await send_command(deviceName: 'Samsung A70',command: '29',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    }
                  },
                  child: RectangleButton(icon: Icons.slow_motion_video_outlined))
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
                GestureDetector(
                  onTap: () async{
                      var response = await send_command(deviceName: 'Samsung A70',command: '25',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
                  onHorizontalDragEnd: (details)async {
                    if(details.velocity.pixelsPerSecond.dx>0){
                      var response = await send_command(deviceName: 'Samsung A70',command: '21',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);}
                    },
                  child: RectangleButton(
                    icon: Icons.skip_previous_outlined,
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                      var response = await send_command(deviceName: 'Samsung A70',command: '26',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
                   onHorizontalDragEnd: (details)async {
                    if(details.velocity.pixelsPerSecond.dx>0){
                      var response = await send_command(deviceName: 'Samsung A70',command: '20',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);}
                    },
                  child: RectangleButton(icon: Icons.skip_next_outlined)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
