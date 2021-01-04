import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 使用ScaleTransition系统组件(不需要自己监听和释放)
class ScaleTransitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScaleTransitionPageState();
}

class ScaleTransitionPageState extends State<ScaleTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {

    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = Tween(begin: .5, end: .1).animate(_animationController);

    // 开始动画
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        height: 200,
        width: 200,
        color: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}