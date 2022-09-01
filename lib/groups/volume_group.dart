import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';
import '../utils/utils.dart';

class VolumeController extends StatelessWidget {
  final String IpAddress;
  const VolumeController({super.key, required this.IpAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Container(
        
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
             GestureDetector(
              onTap: () async{
              var response = await send_command(deviceName: 'Samsung A70',command: '4',ADDRESS: IpAddress);
              
            },
               child: RoundedButton(
                       icon: Icons.volume_mute_rounded,
                        height: AppSizes.rectangle_button_height,
                        width: AppSizes.rectangle_button_width,
                        color: AppColors.defaultButtonColor,
                        
                      ),
             ),       
             RectangleButton(
                     icon: Icons.volume_down_rounded,
                      height: AppSizes.rectangle_button_height,
                      width: AppSizes.rectangle_button_width,
                      color: AppColors.defaultButtonColor,
                      
                    )
          ],
        ),
      ),
    );
  }
}