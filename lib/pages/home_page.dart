import 'package:flutter/material.dart';
import 'package:flutter_components/utils/icono_string_util.dart';
import './../provider/menu_provider.dart';
import 'package:flutter_components/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Componentes'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //menuProvider.cargarData();

    return new FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // print('builder');
        print(snapshot.data);
        return new ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    //if(data==null){return[];}
    data.forEach((opt) {
      final widgetTemp = new ListTile(
        title: new Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: new Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          /*final route =MaterialPageRoute(
             builder: (context)=> new AlertPage()
           );
           Navigator.push(context, route);*/
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(new Divider());
    });
    return opciones;
  }
}
