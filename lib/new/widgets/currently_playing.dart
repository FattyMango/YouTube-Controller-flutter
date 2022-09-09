import 'package:flutter/material.dart';
import 'package:youtube_controller/new/buttons/circle_button.dart';
import 'package:youtube_controller/new/buttons/rectangle_button.dart';
import 'package:youtube_controller/new/buttons/subscribe_button.dart';
import 'package:youtube_controller/new/misc/colors.dart';

class CurrentlyPlaying extends StatefulWidget {
  dynamic currentVideo;
  CurrentlyPlaying({super.key,required this.currentVideo});

  @override
  State<CurrentlyPlaying> createState() => _CurrentlyPlayingState();
}

class _CurrentlyPlayingState extends State<CurrentlyPlaying> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: 175,
        decoration: BoxDecoration(
            color: AppColors.mainWidgetColor,
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Row(
            children: [
              Container(
                width: 195,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            ),
                        child:Image.network(widget.currentVideo['thumbnail'],fit: BoxFit.cover,)
                            ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(100),
                              ),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(widget.currentVideo['channel_img'],fit: BoxFit.cover,height: double.infinity,width: double.infinity,alignment: Alignment.center,))
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 100,
                            child: Text(
                              widget.currentVideo['channel'],
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            )),
                        SizedBox(width: 7.5),
                        SubscribeButton(isSubscribed: widget.currentVideo['subscribed'],)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      widget.currentVideo['title'],
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      widget.currentVideo['views'],
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      widget.currentVideo['current_time']+'/'+widget.currentVideo['full_time'],
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 95,
                        height: 2,
                        color: AppColors.youtubeRed,
                      ),
                      Container(
                        width: 40,
                        height: 2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      CircleButton(
                          icon: Icons.thumb_up_alt_sharp,
                          iconColor : widget.currentVideo['like']==true? Colors.blue : Colors.black.withOpacity(0.8),
                          size: 50,
                          color: Colors.white.withOpacity(0.92)),
                      SizedBox(
                        width: 10,
                      ),
                      CircleButton(
                          icon: Icons.thumb_down_alt_sharp,
                          iconColor : widget.currentVideo['dislike']==true? Colors.blue : Colors.black.withOpacity(0.8),
                          size: 50,
                          color: Colors.white.withOpacity(0.92)),
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
