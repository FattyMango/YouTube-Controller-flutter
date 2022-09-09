import 'package:flutter/material.dart';
import 'package:youtube_controller/old/groups/header_group.dart';
import 'package:youtube_controller/old/groups/media_group.dart';
import 'package:youtube_controller/old/groups/quality_group.dart';
import 'package:youtube_controller/old/groups/shortcut_group.dart';
import 'package:youtube_controller/old/misc/colors.dart';
import 'package:youtube_controller/utils/utils.dart';

import '../groups/volume_group.dart';
import '../misc/sizes.dart';
import '../../pages/main_page_old.dart';
import '../buttons/rectangle_button.dart';

class RemoteController extends StatefulWidget {
  String IpAddress = '';
   RemoteController({super.key});

  @override
  State<RemoteController> createState() => _RemoteControllerState();
}

class _RemoteControllerState extends State<RemoteController> {
 
  bool isPlaying = false;
  void setAll(bool isPlaying){

      setState(() {
        this.isPlaying = isPlaying;
      });
  }
  void _handleIpFieldSubmitted(input){

setState(() {
  widget.IpAddress = input;
});
}
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Container(
        color: AppColors.mainBackgroundColor,
        width: MediaQuery.of(context).size.width-10,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, bottom: 75, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Container(
              width:  MediaQuery.of(context).size.width-110,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                  
                    prefixIcon: const Icon(Icons.network_wifi_2_bar_rounded),
                    hintText: 'Enter IP Address.',
                    border: InputBorder.none),
                
                onSubmitted: (input){_handleIpFieldSubmitted(input);},
                onChanged: (input){_handleIpFieldSubmitted(input);},
              ),
            ),
                
                SizedBox(height: 5,),
                SearchBarController(IpAddress:widget.IpAddress),
                Container(
                  
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        VolumeController(IpAddress: widget.IpAddress,),
                        RectangleButton(
                          icon: Icons.power_settings_new_rounded,
                          height: AppSizes.rectangle_button_width * 3,
                          width: AppSizes.rectangle_button_height * 1.5,
                          color: AppColors.trueButtonColor
                        ),
                        MediaController(setAll:setAll,isPlaying: isPlaying,IpAddress:widget.IpAddress),
                      ]),
                ),
                QualityController(IpAddress: widget.IpAddress,),
                ShortcutController(IpAddress: widget.IpAddress,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
