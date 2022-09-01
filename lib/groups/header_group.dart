import 'package:flutter/material.dart';
import 'package:youtube_controller/buttons/rounded_button.dart';

import '../misc/colors.dart';
import '../misc/sizes.dart';
import '../buttons/rectangle_button.dart';
import '../utils/utils.dart';

class SearchBarController extends StatefulWidget {
  final String IpAddress;
  SearchBarController({super.key, required this.IpAddress});

  @override
  State<SearchBarController> createState() => _SearchBarControllerState();
}

class _SearchBarControllerState extends State<SearchBarController> {
  bool isActive = false;

  String SearchInput = '';

  void _handleSearchBarChanged(String input){
    // setState(() {
    // //   SearchInput = input;
    // //   if (SearchInput!='')
    // //   isActive = true;
    // //   else
    // //   isActive = false;
    // // });
    // // print(SearchInput);
  }
  void _handleSearchSubmitted(String input) async{
    
    if(input.isNotEmpty)
      var response = await send_command(deviceName: 'Samsung A70',command: '10',option:input,ADDRESS: widget.IpAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: !isActive ? 50 : 200,
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              width:  MediaQuery.of(context).size.width-110,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
              child: TextField(
                
                decoration: InputDecoration(
                  
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...',
                    border: InputBorder.none),
                onChanged: (input) {
                  _handleSearchBarChanged(input);
                  
                },
                onSubmitted: (input){_handleSearchSubmitted(input);},
              ),
            )
          
          ]),
        isActive
        ?SizedBox(height: 5,)
        :Container(),
        isActive
        ?Container(
          width:  MediaQuery.of(context).size.width-125,
          height: 150,
          
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            
            itemCount: 3,
            itemBuilder: (context,index){
              return 
              Container(child:ListTile(
                  
                  
                  textColor: Colors.black,
                  title: Text(SearchInput+index.toString(),style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w500),),
                  onTap: (){print(SearchInput+index.toString());},
                ),
                decoration: BoxDecoration(color: AppColors.defaultButtonColor.withOpacity(0.6),
                border: Border.all(color: AppColors.mainBackgroundColor,),
                borderRadius: BorderRadius.circular(5)
                ),
                 )
                ;
              
          
          }),
        )
        
        :Container()
        ],
      ),
    );
  }
}
