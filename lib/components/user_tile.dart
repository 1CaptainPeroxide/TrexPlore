import "package:flutter/material.dart";

class UserTile extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  const UserTile({
    super.key, 
    required this.text, 
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xffEF32D9 ),
              
              
              Color(0xff89FFFD),
              Color(0xff96C93D),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),

        child: Row(children: [
          SizedBox(
            height: 38,
            child: Image.asset(
                    'lib/icons/message.png',
                    
                  ),
          ),
          SizedBox(width: 20,),
          //username
          Text(text, style: TextStyle(fontSize: 18),),
        ],)
      ),
    );
  }
}