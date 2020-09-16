import 'package:flutter/material.dart';
class HomePageTemp extends StatelessWidget {
  final opciones =['Uno','Dos','Tres','Cuatro','Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
         title: new Text('Componentes temp'),
        ),
      body: new ListView(
        children:_crearItemsCorta()
      ),
    );
  }
  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();
      for(String opt in opciones){
        final tempWidget = new ListTile(
          title: new Text(opt),
        );
        lista..add(tempWidget)
             ..add(new Divider());
      }

    return lista;
  }

  List<Widget> _crearItemsCorta(){
    return opciones.map((dato){
      return Column(
        children: <Widget>[
          new ListTile(
            title: new Text(dato),
            subtitle: new Text('Hola mundo!'),
            leading: new Icon(Icons.account_balance_wallet),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          new Divider(),
        ],
      );
    }).toList();
  }

}
