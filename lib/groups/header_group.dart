import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';

class SearchBarController extends StatelessWidget {
  const SearchBarController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height:50 ,
      child: 
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               
          
          Row(
            children:[
            Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )]
      )]),
          
        ],
      ),
    );
  }
}