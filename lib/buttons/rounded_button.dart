import 'package:flutter/material.dart';
import 'package:youtube_controller/misc/colors.dart';
import 'package:youtube_controller/misc/sizes.dart';

class RoundedButton extends StatelessWidget {
  final IconData? icon;

  final bool is_icon;
   final Color? color ;
  String? text;
  final double height;
  final double width;

  RoundedButton(
      {super.key,
      this.is_icon = true,
      this.icon,
      this.color =   AppColors.radioButtonColor,
      required this.height,
      required this.width,
      this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
          child: is_icon
              ? Icon(icon, size: AppSizes.icon_size)
              : Text(
                  text!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
    );
  }
}
