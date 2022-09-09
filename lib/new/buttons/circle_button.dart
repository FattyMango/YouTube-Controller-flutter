import 'package:flutter/material.dart';
import 'package:youtube_controller/new/misc/colors.dart';

class CircleButton extends StatefulWidget {
  final double size;
  final IconData? icon;
  final Color color;
  final Color? iconColor;
  const CircleButton({super.key, this.size = 85, this.icon,  this.color=AppColors.buttonColor,  this.iconColor});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: widget.size/1.8,
        ),
      ),
    );
  }
}
