import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';
import '../utils/utils.dart';

class ShortcutController extends StatelessWidget {
  const ShortcutController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height:75 ,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
           GestureDetector(
            onTap: () async{
            
              var response = await send_command(deviceName: 'Samsung A70',command: '7');
              
            },
             child: RoundedButton(
                      text: "R",
                      height:AppSizes.rectangle_button_width+10  ,
                      width: AppSizes.rectangle_button_height+10 ,
                      is_icon: false,
                    ),
           ),
          GestureDetector(
            onTap: () async{
            
              var response = await send_command(deviceName: 'Samsung A70',command: '2');
              
            },
            child: RoundedButton(
                      text: "C",
                      height:AppSizes.rectangle_button_width +10 ,
                      width: AppSizes.rectangle_button_height+10 ,
                      is_icon: false,
                    ),
          ),
          GestureDetector(
            onTap: () async{
            
              var response = await send_command(deviceName: 'Samsung A70',command: '3');
              
            },
            child: RoundedButton(
                      text: "F",
                      height:AppSizes.rectangle_button_width+10 ,
                      width: AppSizes.rectangle_button_height+10 ,
                      is_icon: false,
                    ),
          ),
          
        ],
      ),
    );
  }
}