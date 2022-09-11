import 'package:flutter/material.dart';

import '../../new/buttons/rectangle_button.dart';
import '../misc/colors.dart';

class SubscribeButton extends StatefulWidget {
   bool isSubscribed ;
   SubscribeButton({super.key, this.isSubscribed = false});

  @override
  State<SubscribeButton> createState() => _SubscribeButtonState();
}

class _SubscribeButtonState extends State<SubscribeButton> {

  @override
  Widget build(BuildContext context) {
    return RectangleButton(
      width: 52.5,
      height: 30,
      text: widget.isSubscribed
      ?"subscribed"
      :"Subscribe",
      isIcon: false,
      roundedBorder: 3,
      color: widget.isSubscribed
      ? AppColors.buttonColor
      : AppColors.youtubeRed,
    );
  }
}
