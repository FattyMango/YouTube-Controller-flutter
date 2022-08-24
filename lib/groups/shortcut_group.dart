import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';

class ShortcutController extends StatelessWidget {
  const ShortcutController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height:75 ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
           RoundedButton(
                    text: "R",
                    height:AppSizes.rectangle_button_width+10  ,
                    width: AppSizes.rectangle_button_height+10 ,
                    color: AppColors.defaultButtonColor,
                    is_icon: false,
                  ),
          RoundedButton(
                    text: "C",
                    height:AppSizes.rectangle_button_width +10 ,
                    width: AppSizes.rectangle_button_height+10 ,
                    color: AppColors.defaultButtonColor,
                    is_icon: false,
                  ),
          RoundedButton(
                    text: "F",
                    height:AppSizes.rectangle_button_width+10 ,
                    width: AppSizes.rectangle_button_height+10 ,
                    color: AppColors.defaultButtonColor,
                    is_icon: false,
                  ),
          
        ],
      ),
    );
  }
}