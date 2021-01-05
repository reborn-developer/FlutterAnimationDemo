import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationAnimationPage extends StatelessWidget {

  /// 自定义转场动画 只需要修改transitionsBuilder
  void _transitionBuilderPush(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return _TwoPage();
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return SlideTransition(
            position: Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
                animation),
            child: child,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: OutlineButton(
          child: Text('跳转'),
          onPressed: () {
            /// 1、不区分平台,都是从左到右。
            // Navigator.push(context, CupertinoPageRoute(builder: (context) {
            //   return _TwoPage();
            // }));

            /// 2、区分平台 Android效果为从下到上，iOS效果为从左到右
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return _TwoPage();
            // }));

            /// 3、自定义转场动画
            // _transitionBuilderPush(context);

            /// 4、封装好的可复用的自定义转场动画（同3一样)
            Navigator.push(context, LeftToRightPageRoute(_TwoPage()));
          },
        ),
      ),
    );
  }
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

class LeftToRightPageRoute extends PageRouteBuilder {
  final Widget newPage;

  LeftToRightPageRoute(this.newPage)
       : super(
         pageBuilder: (
             BuildContext context,
             Animation<double> animation,
             Animation<double> secondaryAnimation,
         ) =>
         newPage,
       transitionsBuilder: (
           BuildContext context,
           Animation<double> animation,
           Animation<double> secondaryAnimation,
           Widget child
       ) => SlideTransition(
         position: Tween(begin: Offset(-1,0), end: Offset(0,0)).animate(animation),
         child: child,
       ),
  );
}
