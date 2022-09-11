import 'package:flutter/material.dart';
import 'package:youtube_controller/new/buttons/circle_button.dart';
import 'package:youtube_controller/new/misc/colors.dart';

import '../../utils/utils.dart';

class BottomSheetController extends StatefulWidget {
  bool isPlaying;
  String IpAddress;
  final void Function(dynamic) setResponse;
  BottomSheetController(
      {super.key,
      required this.isPlaying,
      required this.IpAddress,
      required this.setResponse});

  @override
  State<BottomSheetController> createState() => _BottomSheetControllerState();
}

class _BottomSheetControllerState extends State<BottomSheetController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: AppColors.mainWidgetColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async{
                      var response = await send_command(deviceName: 'Samsung A70',command: '16',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
                child: CircleButton(
                  size: 65,
                  icon: Icons.replay_10_sharp,
                ),
              ),
              GestureDetector(
                onTap: () async{
                      var response = await send_command(deviceName: 'Samsung A70',command: '11',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
                child: CircleButton(
                  size: 100,
                  icon: widget.isPlaying
                      ? Icons.pause_outlined
                      : Icons.play_arrow_outlined,
                  color: AppColors.youtubeRed.withAlpha(250),
                ),
              ),
              GestureDetector(
                onTap: () async{
                      var response = await send_command(deviceName: 'Samsung A70',command: '15',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
                child: CircleButton(
                  size: 65,
                  icon: Icons.forward_10_sharp,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
