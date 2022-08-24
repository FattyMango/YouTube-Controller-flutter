import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';

class QualityController extends StatelessWidget {
  const QualityController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height:75 ,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
             RectangleButton(
                     icon: Icons.high_quality_rounded,
                      height:AppSizes.rectangle_button_width ,
                      width: AppSizes.rectangle_button_height,
                      color: AppColors.defaultButtonColor,
                    ),
             RectangleButton(
                     is_icon: false,
                     text: "144p",
                     
                      height:AppSizes.rectangle_button_width ,
                      width: AppSizes.rectangle_button_height,
                      color: AppColors.defaultButtonColor,
                    ),
            RectangleButton(
                     
                     is_icon: false,
                     text: "Auto",
                      height:AppSizes.rectangle_button_width ,
                      width: AppSizes.rectangle_button_height,
                      color: AppColors.defaultButtonColor,
                    ),
          ],
        ),
      ),
    );
  }
}