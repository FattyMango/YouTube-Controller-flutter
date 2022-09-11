import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube_controller/new/misc/colors.dart';
import 'package:youtube_controller/new/widgets/bottom_sheet_controller.dart';
import 'package:youtube_controller/new/widgets/buttons_group.dart';

import 'package:youtube_controller/new/widgets/circle_controller.dart';
import 'package:youtube_controller/new/widgets/currently_playing.dart';
import 'package:youtube_controller/new/widgets/header_group.dart';

import '../new/widgets/videos_controller.dart';
import '../utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isON =false;
  String state = 'home';
  String url = '';
dynamic currentVideo={
'subscribed' : false,     
'like'    : false,            
'dislike'   : false,      
'current_time' :  "",  
'full_time' : "",             
'title' : "Nothing is playing." ,             
'views'  : "" ,                  
'channel'   : "" , 
"channel_img": "https://user-images.githubusercontent.com/43302778/106805462-7a908400-6645-11eb-958f-cd72b74a17b3.jpg",         
'thumbnail'  : "https://user-images.githubusercontent.com/43302778/106805462-7a908400-6645-11eb-958f-cd72b74a17b3.jpg"
};
dynamic currentVideoStatus = {
'playing'            : false,           
'muted'              : false,              
'full_screen'        : false,
'auto_play'          : false,         
'subtitle_pressed'   : false,  
'subtitle_available' : false,
};



int suggestionsLength = 0;
List suggestions = [];

String IpAddress = '';
void _handleIpFieldSubmitted(input)async{

setState(() {
  IpAddress = input;
});
var response = await send_command(deviceName: 'Samsung A70',command: '0',ADDRESS: IpAddress);
setResponse(response);
}
void _handleIpFieldChanged(input){
setState(() {
  IpAddress = input;
});
}
bool __cleanBoolValue(value){
  return value=='false'? false:true;
}
void setResponse (response){

  setState(() {
    Map<String, dynamic> data = jsonDecode(response); 
    print(response);
    try {isON = __cleanBoolValue(data['is_on']);}
    catch(e){};
    print(isON);
    try{
      
      
      state = data['page_status']['state'];
      url = data['page_status']['url'];
    } 
    catch(e){
      print('e');
    }
    if (state == 'watch'){
    try {  
    currentVideoStatus['playing']                = __cleanBoolValue(data['video_status']['playing']);   
    currentVideoStatus['muted']                  = __cleanBoolValue(data['video_status']['muted']);      
    currentVideoStatus['full_screen']            = __cleanBoolValue(data['video_status']['full_screen']);
    currentVideoStatus['auto_play']              = __cleanBoolValue(data['video_status']['auto_play']);
    currentVideoStatus['subtitle_pressed']       = __cleanBoolValue(data['video_status']['subtitle_pressed']);
    currentVideoStatus['subtitle_available']     = __cleanBoolValue(data['video_status']['subtitle_available']); 

    currentVideo['subscribed']         = __cleanBoolValue(data['video_status']['subscribed']); 
    currentVideo['like'         ]      = __cleanBoolValue(data['video_status']['like']);             
    currentVideo['dislike'      ]      = __cleanBoolValue(data['video_status']['dislike']);             
    currentVideo['current_time' ]      =   data['video_status']['current_time'];
    currentVideo['full_time'    ]      =   data['video_status']['full_time'];      
    currentVideo['title'        ]      =   data['video_status']['title'];         
    currentVideo['views'        ]      =   data['video_status']['views'];         
    currentVideo['channel'      ]      =   data['video_status']['channel'];        
    currentVideo['thumbnail'    ]      =   data['video_status']['thumbnail'];
    currentVideo['channel_img'  ]      =   data['video_status']['channel_img'];
    
  }
  catch(e){};
  }
  
  try{
  suggestionsLength = data['suggestions']['length']; 
  suggestions       = data['suggestions']['data']; 
  }
  
  catch(e){};
}); 
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.black.withOpacity(0.65),width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Container(
                height: 80,
                color: AppColors.mainWidgetColor,
                margin: EdgeInsets.only(),
                alignment: Alignment.topCenter,
                child: Padding(
                  
                  padding: const EdgeInsets.only(top:35,left: 20),
                  child: Center(
                    child: Text("Suggestions",style: TextStyle(color: Colors.white,fontSize: 26,),textAlign: TextAlign.left,
              ),
                  ),
                ),
              ),
              
              VideosController(suggestions: suggestions,suggestionsLength:suggestionsLength, setResponse: setResponse,IpAddress:IpAddress),
            ],
          ),
        ),
        ),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 60,
              color: AppColors.mainWidgetColor,
              child: HeaderGroup(IpAddress: IpAddress, setResponse: setResponse,isON:isON)
                  
              ),
        )),
      
      
      bottomSheet: Container(
        height: 125,
        width: double.maxFinite,
        child: BottomSheetController(isPlaying : currentVideoStatus['playing'], IpAddress: IpAddress, setResponse: setResponse,),
      ),
      
      
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(
              width:  MediaQuery.of(context).size.width-110,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                  
                    prefixIcon: const Icon(Icons.network_wifi_2_bar_rounded),
                    hintText: 'Enter IP Address.',
                    border: InputBorder.none),
                
                onSubmitted: (input){_handleIpFieldSubmitted(input);},

                onChanged: (input){_handleIpFieldChanged(input);},
              ),
            ),CurrentlyPlaying(currentVideo:currentVideo, IpAddress: IpAddress, setResponse: setResponse,),SizedBox(height: 20,),CircleController(setResponse:setResponse,currentVideoStatus:currentVideoStatus,IpAddress:IpAddress), ButtonsGroup(IpAddress: IpAddress, setResponse: setResponse,),SizedBox(height: 120,)],
            ),
          ),
        ),
      ),
    );
  }
}

