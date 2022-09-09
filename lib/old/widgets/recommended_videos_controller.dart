import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_controller/old/buttons/recommended_video.dart';



class RecommendedVideosController extends StatelessWidget {
  final void Function(String, String) handleRecommendedVideoClicked;
  const RecommendedVideosController({super.key, required this.handleRecommendedVideoClicked});

  @override
  Widget build(BuildContext context) {
    

    return  Container(
      height: MediaQuery.of(context).size.height/2.5,
      child: SingleChildScrollView(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [RecommendedVideo(change_playing_video: handleRecommendedVideoClicked,titleName: "Dave - Starlight",imageName: "img/dafe.jpg",),RecommendedVideo(change_playing_video: handleRecommendedVideoClicked,titleName: "Jiro Inagaki & Soul Media - Funky Stuff (1975)",imageName: "img/jiro.jpg",)],
                
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [RecommendedVideo(change_playing_video: handleRecommendedVideoClicked,titleName: "Macroblank - 痛みの永遠",imageName: "img/macroblank.jpg",),RecommendedVideo(change_playing_video: handleRecommendedVideoClicked,titleName: "Tamino - Fascination",imageName: "img/tamino.jpg",)],
                
              ),
            ),
          ],
        ),
      ),
    );
       
  }
}