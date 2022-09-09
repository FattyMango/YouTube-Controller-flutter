import 'package:flutter/material.dart';
import 'package:youtube_controller/new/buttons/circle_button.dart';
import 'package:youtube_controller/new/misc/colors.dart';

class BottomSheetController extends StatefulWidget {
   bool isPlaying;
   BottomSheetController({super.key, required this.isPlaying});

  @override
  State<BottomSheetController> createState() => _BottomSheetControllerState();
}

class _BottomSheetControllerState extends State<BottomSheetController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Container(
                height: 80,
                
                decoration: BoxDecoration(
           
                    color: AppColors.mainWidgetColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 40,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(size: 65,icon: Icons.replay_10_sharp,),
                  CircleButton(size: 100,

                  icon: widget.isPlaying? Icons.pause_outlined :Icons.play_arrow_outlined,
                  
                  color:AppColors.youtubeRed.withAlpha(250) ,
                  ),
                  CircleButton(size: 65,icon: Icons.forward_10_sharp,),
                ],
              ),
            )
          ],
        ));
  }
}
