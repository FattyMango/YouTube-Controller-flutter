import 'package:flutter/material.dart';
import 'package:youtube_controller/old/misc/colors.dart';

import '../misc/sizes.dart';

class RectangleButton extends StatelessWidget  {
  final IconData? icon;

  final bool is_icon;
  final Color color;
  String? text;
  final double height;
  final double width;
  
  
  RectangleButton({super.key, this.is_icon=true,  this.icon , required  this.color , required this.height, required this.width,this.text});




  @override
  Widget build(BuildContext context) {
    return 
    

       Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color
    
        ),
        
          child: 
              Center(child: is_icon?Icon(icon,size:AppSizes.icon_size):Text(text! ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),)),
            
          
        );
      
   
  }
}