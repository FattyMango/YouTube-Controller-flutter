import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';
import '../utils/utils.dart';

class ShortcutController extends StatelessWidget {
  final String IpAddress;
  const ShortcutController({super.key, required this.IpAddress});

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
            
              var response = await send_command(deviceName: 'Samsung A70',command: '7',ADDRESS: IpAddress);
              
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
            
              var response = await send_command(deviceName: 'Samsung A70',command: '2',ADDRESS: IpAddress);
              
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
            
              var response = await send_command(deviceName: 'Samsung A70',command: '3',ADDRESS: IpAddress);
              
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