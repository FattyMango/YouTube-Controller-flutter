import 'package:flutter/material.dart';
import 'package:youtube_controller/new/misc/colors.dart';

class RectangleButton extends StatefulWidget {
  final bool isIcon;
  final IconData? icon;
  final double width;
  final double height;
  final double roundedBorder;
  final Color color;
  final String? text;
  const RectangleButton({super.key, this.icon,  this.width=125,  this.height=45, this.roundedBorder=15, this.color = AppColors.buttonColor, this.text,  this.isIcon=true});

  @override
  State<RectangleButton> createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
         borderRadius: BorderRadius.circular(widget.roundedBorder)
      ),
      child: widget.isIcon
      ? Icon(
            widget.icon,
            color: Colors.black,
            size: 45,
          )
      : Center(child: Text(widget.text!,style:TextStyle(color: Colors.white,fontSize: 9.5,fontWeight: FontWeight.w400)))
    );
  }
}