import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youtube_controller/misc/sizes.dart';
import 'package:youtube_controller/utils/utils.dart';

import '../misc/colors.dart';
import '../buttons/rectangle_button.dart';
import 'package:dio/dio.dart';
class MediaController extends StatefulWidget {
  final Connection conn;
   MediaController({super.key,required this.conn});

  @override
  State<MediaController> createState() => _MediaControllerState();
}

class _MediaControllerState extends State<MediaController>
    with SingleTickerProviderStateMixin {
  bool is_playing = false;
  bool flag = false;
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
      width: AppSizes.button_group_width,
      height: AppSizes.button_group_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            
            onTap: ()async {
              Socket s = await Socket.connect('localhost', 1234);
              s.add(utf8.encode("5         malak"));
              
              s.add(utf8.encode("2         1"));
              String result = await utf8.decoder.bind(s).join();
               s.close(); // probably need to close the socket
              print(result);
                  
                  },
          child :RectangleButton(
            icon: Icons.forward_10_rounded,
            height: AppSizes.rectangle_button_height,
            width: AppSizes.rectangle_button_width,
            color: flag==true?AppColors.defaultButtonColor:Colors.black,
          )),

          GestureDetector(
            onTap: (){
              if (is_playing){
                _animationController.reverse();
                setState(() {
                  is_playing = false;
                });
              }
              else{
                 _animationController.forward();
                setState(() {
                  is_playing = true;
                });
              }
              
            },
              child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
            size: AppSizes.rectangle_button_height,
            color: Colors.black54.withOpacity(0.7),
          )),
          
          GestureDetector(
            onTap: (){
            print("im tapped!");
              
              
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
