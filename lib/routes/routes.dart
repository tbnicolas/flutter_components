import 'package:flutter/material.dart';
import 'package:flutter_components/pages/alert_page.dart';
import 'package:flutter_components/pages/animated_container.dart';
import 'package:flutter_components/pages/avatar_page.dart';
import 'package:flutter_components/pages/card_page.dart';
import 'package:flutter_components/pages/home_page.dart';
import 'package:flutter_components/pages/input_page.dart';
import 'package:flutter_components/pages/listview_page.dart';
import 'package:flutter_components/pages/slider_page.dart';
Map<String, WidgetBuilder>getAplicationRoutes(){
  return<String, WidgetBuilder>{
  '/':(BuildContext context)=>new HomePage(),
  'alert':(BuildContext context)=>new AlertPage(),
  'avatar':(BuildContext context)=>new AvatarPage(),
  'card':(BuildContext context)=>new CardPage(),
  'animatedContainer':(BuildContext context)=>new AnimatedConatinerPage(),
  'inputs':(BuildContext context)=>new InputPage(),
  'slider':(BuildContext context)=>new SliderPage(),
  'list':(BuildContext context)=>new ListaPage(),
  };
}