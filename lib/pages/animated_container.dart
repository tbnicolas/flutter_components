import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedConatinerPage extends StatefulWidget {
  @override
  _AnimatedConatinerPageState createState() => _AnimatedConatinerPageState();
}

class _AnimatedConatinerPageState extends State<AnimatedConatinerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Animated Container') ,
      ),
      body: new Center(
        child: new AnimatedContainer(
          duration: new Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.play_arrow),
          onPressed: _cambiarForma,

      ),
    );
  }

  void _cambiarForma() {
    final random = new Random();
    setState(() {
      _width =random.nextInt(300).toDouble();
      _height =random.nextInt(300).toDouble();
      _color= Color.fromRGBO(
          random.nextInt(300),
          random.nextInt(300),
          random.nextInt(300),
          1);
      _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble());
    });
  }
}
