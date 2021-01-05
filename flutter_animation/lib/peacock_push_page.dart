import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 孔雀开屏动效打开新页面
class PeacockPushPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: OutlineButton(
          child: Text('跳转'),
          onPressed: () {
            ///1. 直接跳转地方设置动画
            // _peacockPush(context);

            /// 2、封装可复用的（效果同1）
            Navigator.of(context).push(CirclePageRoute(builder: (context) {
              return _TwoPage();
            }));
          },
        ),
      ),
    );
  }
}

/// 孔雀开屏动效
void _peacockPush(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(pageBuilder:
      (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: CirclePath(animation.value),
          child: child,
        );
      },
      child: _TwoPage(),
    );
  }));
}

class _TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}

/// 封装可复用孔雀开屏动效
class CirclePageRoute extends PageRoute {

  CirclePageRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
      return ClipPath(
        clipper: CirclePath(animation.value),
        child: child,
      );
    },
    child: builder(context),
    );
  }
}

/// 孔雀裁切路径
class CirclePath extends CustomClipper<Path> {
  final double value;

  CirclePath(this.value);

  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = value * sqrt(size.height * size.height + size.width * size.width);
    path.addOval(Rect.fromLTRB(size.width - radius, - radius, size.width + radius, radius));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}