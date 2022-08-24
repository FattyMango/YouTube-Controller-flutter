import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';

class VolumeController extends StatelessWidget {
  const VolumeController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.button_group_width,
      height: AppSizes.button_group_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           RectangleButton(
                   icon: Icons.volume_up_rounded,
                    height: AppSizes.rectangle_button_height,
                    width: AppSizes.rectangle_button_width,
                    color: AppColors.defaultButtonColor,
                  ),
           RoundedButton(
                   icon: Icons.volume_mute_rounded,
                    height: AppSizes.rectangle_button_height,
                    width: AppSizes.rectangle_button_width,
                    color: AppColors.defaultButtonColor,
                    
                  ),       
           RectangleButton(
                   icon: Icons.volume_down_rounded,
                    height: AppSizes.rectangle_button_height,
            width: AppSizes.rectangle_button_width,
                    color: AppColors.defaultButtonColor,
                    
                  )
        ],
      ),
    );
  }
}