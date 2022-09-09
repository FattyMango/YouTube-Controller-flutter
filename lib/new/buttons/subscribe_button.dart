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
  void onSubscribeClicked(){
    widget.isSubscribed?
    print("Unsubscribed")
    :
    print("subscribed");
    setState(() {
      widget.isSubscribed = !widget.isSubscribed ;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onSubscribeClicked ,
      child: RectangleButton(
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
      ),
    );
  }
}
