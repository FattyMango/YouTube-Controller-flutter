import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';
import '../utils/utils.dart';

class QualityController extends StatelessWidget {
  const QualityController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height:75 ,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
             GestureDetector(
              onTap: () async{
              var response = await send_command(deviceName: 'Samsung A70',command: '8 ',option:'1' );
              
            },
               child: RectangleButton(
                       icon: Icons.high_quality_rounded,
                        height:AppSizes.rectangle_button_width ,
                        width: AppSizes.rectangle_button_height,
                        color: AppColors.defaultButtonColor,
                      ),
             ),
             GestureDetector(
              onTap: () async{
              var response = await send_command(deviceName: 'Samsung A70',command: '8 ',option:'2' );
              
            },
               child: RectangleButton(
                       is_icon: false,
                       text: "144p",
                       
                        height:AppSizes.rectangle_button_width ,
                        width: AppSizes.rectangle_button_height,
                        color: AppColors.defaultButtonColor,
                      ),
             ),
            GestureDetector(
              onTap: () async{
              var response = await send_command(deviceName: 'Samsung A70',command: '8 ',option:'3' );
              
            },
              child: RectangleButton(
                       
                       is_icon: false,
                       text: "Auto",
                        height:AppSizes.rectangle_button_width ,
                        width: AppSizes.rectangle_button_height,
                        color: AppColors.defaultButtonColor,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}