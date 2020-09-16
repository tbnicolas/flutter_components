import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Cards'),
      ),
      body: new ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return new Card(
      elevation: 10.0,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0)
      ),
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.photo_album, color: Colors.blue,),
            title: new Text('Soy el titulo de esta tarjeta'),
            subtitle: new Text('smdsmsdmdmvdsmvfsmvxcvmxcvmxckmvxcmvxckvxckvmxckvmxckcxcvmcxvkmxckvcxvkmxckmxcmvxckcxmcxkvmxk'),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                  onPressed: (){},
                  child: new Text('Cancelar')
              ),
              new FlatButton(
                  onPressed: (){},
                  child: new Text('Ok')
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = new Container(
      child: new Column(
        children: <Widget>[
          new FadeInImage(
            image: new NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: new AssetImage('assets/jar-loading.gif'),
            fadeInDuration: new Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),

          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Text('No tengo idea de que poner'),
          )
        ],
      ),
    );
    return new Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: new Offset(2.0, -10.0)
          )
        ]
      ),
    );
  }
}
