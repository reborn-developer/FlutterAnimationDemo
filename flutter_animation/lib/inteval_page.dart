import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntervalAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => IntervalAnimationPageState();
}

class IntervalAnimationPageState extends State<IntervalAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorAnimation;
  Animation _sizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 5), vsync: this)
    ..addListener(() {
      setState(() {
      });
    });

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: _animationController,curve: Interval(0.0, 0.5)));

    _sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.5, 1.0)));

    // 开始动画
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: _sizeAnimation.value,
            width: _sizeAnimation.value,
            color: _colorAnimation.value,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}