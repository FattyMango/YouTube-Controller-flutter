import 'package:flutter/material.dart';
import 'package:youtube_controller/new/misc/colors.dart';
import 'package:youtube_controller/new/buttons/recommended_video.dart';

class VideosController extends StatefulWidget {
  List suggestions;
  int suggestionsLength;
  String IpAddress;
   final void Function(dynamic) setResponse;
  VideosController({super.key, required this.suggestions,required this.suggestionsLength, required this.setResponse,required this.IpAddress});

  @override
  State<VideosController> createState() => _VideosControllerState();
}

class _VideosControllerState extends State<VideosController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        margin: EdgeInsets.only(),
        
        child: GridView.builder(
          
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          physics: ScrollPhysics(),
          itemCount:widget.suggestionsLength,
          itemBuilder: (BuildContext context, int index) {
            return RecommendedVideo(video: widget.suggestions[index], setResponse: widget.setResponse,IpAddress: widget.IpAddress);
          
          
          }),
      ),
    );
  }
}