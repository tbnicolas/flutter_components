import 'dart:async';

import 'package:flutter/material.dart';
class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => new _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int>_listaNumero=new List();
  int _ultimoItem =0;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
       // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Listas'),
      ),
      body: new Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      )


    );
  }
  Widget _crearLista(){
    return new RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: new ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index){
            final imagen= _listaNumero[index];
            return new FadeInImage(
                placeholder: new AssetImage('assets/jar-loading.gif'),
                image: new NetworkImage('https://i.picsum.photos/id/$imagen/800/600.jpg'));
          },
          itemCount: _listaNumero.length,
      ),
    );
  }
  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration,(){
      _listaNumero.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed((duration));
  }

  void _agregar10(){
    for(var i=1; i<10; i++){
      _ultimoItem++;
      _listaNumero.add(_ultimoItem);
    }
    setState(() {

    });
  }

   Future<Null> fetchData() async{
     _isLoading = true;
    setState(() {
      final duration = new Duration( seconds: 2);
      return new Timer(duration, respuestaHTTP);
    });
   }
   void respuestaHTTP(){
      _isLoading = false;
      _scrollController.animateTo(
          _scrollController.position.pixels+100,
          duration:new Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn
      );
      _agregar10();
   }

 Widget _crearLoading() {
    if(_isLoading){
      return new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  new CircularProgressIndicator()
              ],
            ),
          new SizedBox(height: 15.0,)
        ],
      );
    }else{
      return new Container();
    }
 }
}
