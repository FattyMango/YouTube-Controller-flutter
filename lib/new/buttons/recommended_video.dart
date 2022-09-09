// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../utils/utils.dart';
class RecommendedVideo extends StatelessWidget {
  final void Function(dynamic) setResponse;
  String IpAddress;
  dynamic video;
   RecommendedVideo({super.key,required this.setResponse,required this.IpAddress,this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: 150,

      // ignore: sort_child_properties_last
      child: GestureDetector(
        onTap: () async {
          Scaffold.of(context).closeEndDrawer();
          
          print("wtf");
          var response = await send_command(deviceName: 'Samsung A70',command: '53',option:video['url'],ADDRESS: IpAddress);
             setResponse(response);

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
                      ),
                    child:Image.network( video['thumbnail'],fit: BoxFit.cover,) ,
                ), 
                
                Positioned(
                left:MediaQuery.of(context).size.width / 2.8 ,
                top: 85,
                child: Container(
                  
                  width: 35,
                  height: 22.5,
                  child: Center(child: Text(video['duration'],style: TextStyle(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                color: Colors.black.withAlpha(70)),
              child: Row(
                children: [
                 
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            video['title'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: Text(
                                video['channel'],
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
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: Text(
                                video['views'],
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 9),
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
