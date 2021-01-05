import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HeroPageState();
}

class HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
        children: List.generate(10, (index) {
          if (index == 6) {
            return InkWell(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new HeroPage2()));
              },
              child: Hero(
                tag: 'hero',
                child: Container(
                  child: Image.asset('assets/images/cartoon.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          }
          return Container(
            color: Colors.red,
          );
        }),
      ),
    );
  }
}

class HeroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Hero(
          tag: 'hero',
          child: Container(
            child: Image.asset('assets/images/cartoon.png'),
          ),
        ),
      ),
    );
  }
}