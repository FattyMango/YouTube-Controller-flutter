import 'package:flutter/material.dart';
import 'package:youtube_controller/misc/colors.dart';
import 'package:youtube_controller/widgets/remote_controller.dart';
import 'package:youtube_controller/buttons/recommended_video.dart';
import 'package:youtube_controller/widgets/bottom_sheet_controller.dart';
import 'package:youtube_controller/widgets/recommended_videos_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = true;
  String imageName = "img/callinu.jpg";
  String titleName = "Outlandish - Callin U (Official Video)";
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
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
    return SizedBox(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
        handleRecommendedVideoClicked: _handleRecommendedVideoClicked,
        titleName: titleName,
        imageName: imageName,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC(
      {super.key,
      this.active = false,
      required this.onChanged,
      required this.titleName,
      required this.imageName,
      required this.handleRecommendedVideoClicked});

  final bool active;
  final ValueChanged<bool> onChanged;
  final void Function(String, String) handleRecommendedVideoClicked;
  String imageName;
  String titleName;
  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleRecommendedVideoClicked(String imageName, String titleName) {
    widget.handleRecommendedVideoClicked(imageName, titleName);
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
                          image: AssetImage(widget.imageName),
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
                borderRadius: widget.active
                    ? BorderRadius.circular(0)
                    : BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
            width: double.maxFinite,
            height:
                widget.active ? 80 : MediaQuery.of(context).size.height / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetController(
                    onTap: _handleTap,
                    is_active: widget.active,
                    title: widget.titleName),
                SizedBox(height: 20),
                !widget.active
                    ? RecommendedVideosController(
                        handleRecommendedVideoClicked:
                            _handleRecommendedVideoClicked,
                      )
                    : Container()
              ],
            )),
        body: RemoteController());
  }
}
