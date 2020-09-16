import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => new _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Slider')
      ),
      body: new Container(
        padding: EdgeInsets.only(top:50.0 ),
        child: new Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
             _crearSwitch(),
            new Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

 Widget _crearSlider() {
    return new Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        //divisions: 20,
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged:(_bloquearCheck)? null: (valor){
          setState(() {
            _valorSlider = valor;
          });
        },
    );
 }

 Widget _crearImagen() {
    return new FadeInImage(
      image: NetworkImage('https://pngimg.com/uploads/batman/batman_PNG111.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
      placeholder: new AssetImage('assets/jar-loading.gif'),
      fadeInDuration: new Duration(milliseconds: 200),
    );
 }

 Widget _checkBox() {
   /* return new Checkbox(
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });

        }
    );*/
   return new CheckboxListTile(
     title: new Text('Bloquer slider'),
       value: _bloquearCheck,
       onChanged: (valor){
         setState(() {
           _bloquearCheck = valor;
         });
       }
   );
 }

  Widget _crearSwitch() {
    return new SwitchListTile(
        title: new Text('Bloquer slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );
  }
}
