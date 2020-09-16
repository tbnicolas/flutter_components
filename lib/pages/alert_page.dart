import 'package:flutter/material.dart';
class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Alert Page'),
      ),
      body: Center(
        child: new RaisedButton(
          onPressed: ()=>_mostrarAlert(context),
          child: new Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: new StadiumBorder(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add_location),
          onPressed: (){
            Navigator.pop(context);
          }
      ),
    );
  }
  void _mostrarAlert(BuildContext context){
     showDialog(
       context:context,
       barrierDismissible: true,
       builder: (context){
         return new AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: new Text('Titulo'),
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text('Este es el contenido de la caja de la alerta'),
                new FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
           actions: <Widget>[
             new FlatButton(
                 onPressed: ()=>Navigator.of(context).pop(),
                 child: new Text('Cancelar')
             ),
             new FlatButton(
                 onPressed: (){
                   Navigator.of(context).pop();
                 },
                 child: new Text('Ok')
             ),
           ],
         );
       }
     );
  }
}
