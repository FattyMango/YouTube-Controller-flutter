// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class RecommendedVideo extends StatelessWidget {
  final void Function(String,String) change_playing_video;
  final String imageName ;
  final String titleName;
   RecommendedVideo({super.key,required this.change_playing_video,this.imageName= "img/thumb.jpg",this.titleName= 'B O U N D .'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: 175,

      // ignore: sort_child_properties_last
      child: GestureDetector(
        onTap: (){
          change_playing_video(imageName,titleName);
        },
        child: Column(
          children: [
            Stack(
              children: [Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: MediaQuery.of(context).size.height / 8.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black87.withOpacity(0.8),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imageName))),
                ), 
                Positioned(
                left:MediaQuery.of(context).size.width / 2.7 ,
                top: MediaQuery.of(context).size.height / 12,
                child: Container(
                  width: 35,
                  height: 22.5,
                  child: Center(child: Text('4:28',style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),)),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black.withAlpha(70).withOpacity(0.7),)
                ),
              ),
            
                ]
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2.0,
              decoration: BoxDecoration(color: Colors.black.withAlpha(70)),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 40,
                          minWidth: 25
                        ),
                        width: MediaQuery.of(context).size.width / 12,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage("img/channel.jpg"))),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(
                            titleName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: Text(
                                'Marwan Moussa',
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 8,
                              child: Text(
                                '770,266 views',
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withAlpha(3), width: 2),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
