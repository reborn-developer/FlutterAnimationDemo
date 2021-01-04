
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenSequencePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => TweenSequencePageState();
}

class TweenSequencePageState extends State<TweenSequencePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 5), vsync: this)
      ..addListener(() {
        setState(() {
        });
      });

    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 100.0, end: 200.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 40),
      TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 40),
    ]).animate(_animationController);

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
            height: _animation.value,
            width: _animation.value,
            color: Colors.blue,
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