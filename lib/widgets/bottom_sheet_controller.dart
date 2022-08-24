import 'package:flutter/material.dart';

class BottomSheetController extends StatelessWidget {
  final void Function() onTap;
  bool is_active ;
  final String title;
   BottomSheetController({super.key,required this.onTap,required this.is_active, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(top:10,left: 15,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Text(title,style: TextStyle(color: Colors.white,fontSize: 18),overflow: TextOverflow.ellipsis,)),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("The Real Eve.",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 13),),
                    Text(" 2:36",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 13),)
                  ],
                )
                
                ],
            ),
            
            SizedBox(width: 20,),
            IconButton(onPressed: onTap, icon:Icon( is_active?Icons.arrow_upward_rounded:Icons.arrow_downward_rounded,color: Colors.white,))
          ],

        ),
      )
      
    );
  }
}