import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youtube_controller/misc/sizes.dart';
import 'package:youtube_controller/utils/utils.dart';

import '../misc/colors.dart';
import '../buttons/rectangle_button.dart';

class MediaController extends StatefulWidget {
  final void Function(bool) setAll;
  final bool isPlaying;
   MediaController({super.key,required this.setAll, this.isPlaying = false});

  @override
  State<MediaController> createState() => _MediaControllerState();
}

class _MediaControllerState extends State<MediaController>
    with SingleTickerProviderStateMixin {
  
  bool flag = true;
  late AnimationController _animationController;
  
  _MediaControllerState( );
  @override
  void initState()   {
    
    // TODO: implement initState
    super.initState();
    _animationController =AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }
  
  @override
  Widget build(BuildContext context) {
    

    return Container(
      
      height: AppSizes.button_group_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            
            onTap: ()async {
              Socket s = await Socket.connect('localhost', 1234);
              s.add(utf8.encode("5         malak"));
              
              s.add(utf8.encode("1         5"));
              s.close();
              String result = await utf8.decoder.bind(s).join();
              var lists = json.decode(result);

              print(lists['Playing']);
                  
                  },
          child :RectangleButton(
            icon: Icons.forward_10_rounded,
            height: AppSizes.rectangle_button_height,
            width: AppSizes.rectangle_button_width,
            color:AppColors.defaultButtonColor,
          )),

          GestureDetector(
            onTap: () async{
              
              var response = await send_command(deviceName: 'Samsung A70',command: '1');
              print(response);
              widget.setAll(response['Playing']);

              if (widget.isPlaying)
                _animationController.forward();
              else
                 _animationController.reverse();
                
              
              
            },
              child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
            size: AppSizes.rectangle_button_height,
            color: Colors.black54.withOpacity(0.7),
          )),
          
          GestureDetector(
            onTap: () async{
            
              var response = await send_command(deviceName: 'Samsung A70',command: '6');
              
            },
          child :RectangleButton(
            icon: Icons.replay_10_rounded,
            height: AppSizes.rectangle_button_height,
            width: AppSizes.rectangle_button_width,
            color: AppColors.defaultButtonColor,
          ))
        ],
      ),
    );
  }
}
