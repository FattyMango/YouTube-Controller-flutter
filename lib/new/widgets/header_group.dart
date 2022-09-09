import 'package:flutter/material.dart';
import 'package:youtube_controller/new/misc/colors.dart';

class HeaderGroup extends StatefulWidget {
  const HeaderGroup({super.key});

  @override
  State<HeaderGroup> createState() => _HeaderGroupState();
}

class _HeaderGroupState extends State<HeaderGroup> {
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
    await Future.delayed(const Duration(milliseconds: 300));
    Scaffold.of(context).openEndDrawer();
    // if(input.isNotEmpty)
    //   var response = await send_command(deviceName: 'Samsung A70',command: '10',option:input,ADDRESS: widget.IpAddress);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.power_settings_new_sharp,color: AppColors.buttonColor,size:40 ,),
            Container(
              width:  MediaQuery.of(context).size.width-110,
              height: 40,
              decoration: BoxDecoration(
                   border: Border(bottom: BorderSide(width: 1.5, color: AppColors.mainBackgroundColor),)
                   ),
              child: TextField(
                style: TextStyle(color: AppColors.mainBackgroundColor),
                decoration: InputDecoration(
                    
                    prefixIcon: const Icon(Icons.search,color: AppColors.mainBackgroundColor,),
                    hintText: 'Search...',                    
                    hintStyle:TextStyle(color: AppColors.mainBackgroundColor),
                    ),
                onChanged: (input) {
                  _handleSearchBarChanged(input);
                  
                },
                onSubmitted: (input){_handleSearchSubmitted(input);},
              ),
            )
          
          ]);
  }
}