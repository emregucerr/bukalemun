import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}
enum CustomAppBarMode{
  light,
  green,
}
class _CustomAppBarState extends State<CustomAppBar> {
  Color customAppBarColor = Colors.white;
  CustomAppBarMode mode = CustomAppBarMode.light;

  Color lightModeColor = Colors.white;
  Color greenModeColor = Color.fromRGBO(101, 173, 132, 1);

  _toggleAnimation(){ /// Toggling Animation Change
    //! Asset Change Will be added later on
    
    if(mode == CustomAppBarMode.light){
      setState(() {
       mode = CustomAppBarMode.green; 
       customAppBarColor = greenModeColor;
      });
    }else if(mode == CustomAppBarMode.green){
      setState(() {
       mode = CustomAppBarMode.light; 
       customAppBarColor = lightModeColor;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final animationDuration = Duration(milliseconds: 300);
    return Column(
        children: <Widget>[
          AnimatedContainer( ///Upper padding that will
            height: media.padding.top,
            width: double.infinity,
            duration: animationDuration,
            curve: Curves.ease,
            color: customAppBarColor,

          ),
          AnimatedContainer(
            duration: animationDuration,
            curve: Curves.ease,
            height: 65.0,
            width: double.infinity,
            color: customAppBarColor,
            child: Center(child: Container(
              padding: EdgeInsets.all(8),
              child: new Image.asset(
                "assets/assets/bukalemunlogo.png"
              ),
            ),),
          ),
        ],
      
    );
  }
}
