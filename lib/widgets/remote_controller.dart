import 'package:flutter/material.dart';
import 'package:youtube_controller/groups/header_group.dart';
import 'package:youtube_controller/groups/media_group.dart';
import 'package:youtube_controller/groups/quality_group.dart';
import 'package:youtube_controller/groups/shortcut_group.dart';
import 'package:youtube_controller/misc/colors.dart';
import 'package:youtube_controller/utils/utils.dart';

import '../groups/volume_group.dart';
import '../misc/sizes.dart';
import '../pages/main_page.dart';
import '../buttons/rectangle_button.dart';

class RemoteController extends StatefulWidget {
  
  const RemoteController({super.key});

  @override
  State<RemoteController> createState() => _RemoteControllerState();
}

class _RemoteControllerState extends State<RemoteController>  {
  Connection conn = new Connection();
  @override

  @override
  Widget build(BuildContext context) {
   
    return  Center(
          child: Container(
            color: AppColors.mainBackgroundColor,
           width: 400,
           height: MediaQuery.of(context).size.height,
           child: Padding(
             padding: const EdgeInsets.only(right: 30,left: 30,bottom:75 ,top: 20),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  SearchBarController(),
                   
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       
                       VolumeController(),
             
                       RectangleButton(
                          icon: Icons.power_settings_new_rounded,
                           height:AppSizes.rectangle_button_width*3 ,
                           width: AppSizes.rectangle_button_height*1.5,
                           color: AppColors.defaultButtonColor,
                         ),
                       
                       
                       MediaController(conn:conn),
                       
                     ]),
                   
                   SizedBox(height:0),
                   
                   
                     Row(
                       children: [
                        QualityController() 
                       ],
                     ),
                   
                   
                      Row(
                        
                       children: [
                        ShortcutController() 
                       ],
                     ),  
                        
                        ],
               ),
             ),
           ),
              ),
        
      
      
    );
        
    
  }
}