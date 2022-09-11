// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';


import '../../utils/utils.dart';
import 'circle_button.dart';

// ignore: must_be_immutable
class QualityOptions extends StatefulWidget {
   String IpAddress;
  final void Function(dynamic) setResponse;
  bool pressedQuality;
  final void Function() onQualityOptionsPressed;
  QualityOptions(
      {super.key,
      required this.pressedQuality,
      required this.onQualityOptionsPressed, required this.IpAddress, required this.setResponse});

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
          onTap: () async{
            widget.onQualityOptionsPressed();
                  var response = await send_command(deviceName: 'Samsung A70',command: '51',option: '1',ADDRESS: widget.IpAddress);
                  widget.setResponse(response);
                },
          child: CircleButton(
            size: 50,
            icon: Icons.high_quality_sharp,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () async{
              widget.onQualityOptionsPressed();
                      var response = await send_command(deviceName: 'Samsung A70',command: '51',option: '2',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
            child: CircleButton(
              size: 50,
              icon: Icons.zoom_out
            )),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () async{
              widget.onQualityOptionsPressed();
                      var response = await send_command(deviceName: 'Samsung A70',command: '51',option: '3',ADDRESS: widget.IpAddress);
                      widget.setResponse(response);
                    },
            child: CircleButton(
              size: 50,
              icon: Icons.hdr_auto_sharp,
            )),
      ],
    );
  }
}
