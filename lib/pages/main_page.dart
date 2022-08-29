import 'package:flutter/material.dart';
import 'package:youtube_controller/misc/colors.dart';
import 'package:youtube_controller/widgets/remote_controller.dart';

import 'package:youtube_controller/widgets/bottom_sheet_bar_controller.dart';
import 'package:youtube_controller/widgets/recommended_videos_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isBottomSheetActive = true;
  String imageName = "img/callinu.jpg";
  String titleName = "Outlandish - Callin U (Official Video)";
  

  void _handleBottomSheetClicked() {
    setState(() {
      isBottomSheetActive = !isBottomSheetActive;
    });
  }

  void _handleRecommendedVideoClicked(String imageName, String titleName) {
    setState(() {
      this.imageName = imageName;
      this.titleName = titleName;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.black87.withOpacity(0.8),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(imageName),
                          opacity: 0.5,
                        ),
                        backgroundBlendMode: BlendMode.darken),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 4)-4,
                    child: LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width,
                      lineHeight: 4,
                      percent: 0.79,
                      alignment: MainAxisAlignment.end,
                      padding: EdgeInsets.all(0),
                      progressColor: Colors.red,
                    ),
                  )
                ],
              )),
        ),
        bottomSheet: Container(
            decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.8),
                borderRadius: isBottomSheetActive
                    ? BorderRadius.circular(0)
                    : BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
            width: double.maxFinite,
            height:
                isBottomSheetActive ? 80 : MediaQuery.of(context).size.height / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomBarSheetController(
                    onTap: _handleBottomSheetClicked,
                    is_active: isBottomSheetActive,
                    title: titleName),
                SizedBox(height: 20),
                !isBottomSheetActive
                    ? RecommendedVideosController(
                        handleRecommendedVideoClicked:
                            _handleRecommendedVideoClicked,
                      )
                    : Container()
              ],
            )),
        body: RemoteController());
  }}
