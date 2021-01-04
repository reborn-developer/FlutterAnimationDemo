import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// AnimatedList提供了一种简单的方式使列表数据发生变化时加入过渡动画，
class AnimatedListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedListPageState();
}

class AnimatedListPageState extends State<AnimatedListPage>
    with SingleTickerProviderStateMixin {
   List<int> _list = [];
   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

   void _addItem() {
     final int _index = _list.length;
     _list.insert(_index, _index);
     _listKey.currentState.insertItem(_index);
   }

   void _removeItem() {
     final int _index = _list.length - 1;
     var item = _list[_index].toString();
     _listKey.currentState.removeItem(_index, (context, animation) => _buildItem(item, animation));
     _list.removeAt(_index);
   }

   // Widget _buildItem(String _item, Animation _animation) {
   //   return SlideTransition(
   //     position: _animation.drive(CurveTween(curve: Curves.easeIn)).drive(Tween<Offset>(begin: Offset(1,1), end: Offset(0,1))),
   //     child: Card(
   //       child: ListTile(
   //         title: Text(
   //           _item,
   //         ),
   //       ),
   //     ),
   //   );
   // }

   ///掉落效果
   Widget _buildItem(String _item, Animation _animation) {
     return SizeTransition(
       sizeFactor: _animation,
       child: Card(
         child: ListTile(
           title: Text(
             _item,
           ),
         ),
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: AnimatedList(
         key: _listKey,
         initialItemCount: _list.length,
         itemBuilder: (BuildContext context, int index, Animation animation) {
           return _buildItem(_list[index].toString(), animation);
         },
       ),
       floatingActionButton: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget> [
           FloatingActionButton(
             onPressed: () => _addItem(),
             child: Icon(Icons.add),
           ),
           SizedBox(
             width: 60,
           ),
           FloatingActionButton(
             onPressed: () => _removeItem(),
             child: Icon(Icons.remove),
           ),
         ],
       ),
     );
  }
}