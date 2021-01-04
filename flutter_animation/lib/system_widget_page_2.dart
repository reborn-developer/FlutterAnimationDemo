import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 使用系统库AnimatedOpacity(AnimationController、Tween、Curve系统自动管理，不需要我们手写)
class AnimatedOpacityPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AnimatedOpacityPageState();
}

class AnimatedOpacityPageState extends State<AnimatedOpacityPage> {

  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 2),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = 0;
            });
          },
          child: Container(
            height: 60,
            width: 150,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}