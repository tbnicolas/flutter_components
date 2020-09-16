import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos x', 'Super aliento', 'Super fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Inputs de texto'),
      ),
      body: new ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          new Divider(),
          _crearEmail(),
          new Divider(),
          _crearPassword(),
          new Divider(),
          _crearFecha(context),
          new Divider(),
          _crearDropdown(),
          new Divider(),
          _crearPersonas(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return new TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          counter: new Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: new Icon(Icons.accessibility),
          icon: new Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
        print(_nombre);
      },
    );
  }

  Widget _crearPersonas() {
    return ListTile(
      title: new Text('Nombre es: $_nombre'),
      subtitle: new Text('Email: $_email'),
      trailing: new Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return new TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: new Icon(Icons.alternate_email),
            icon: new Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return new TextField(
        obscureText: true,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: new Icon(Icons.lock_open),
            icon: new Icon(Icons.lock)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return new TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: new Icon(Icons.perm_contact_calendar),
          icon: new Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDate(context);
      },
    );
  }

  void _selecDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      //locale: new Locale('es', 'Es'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: new Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return new Row(
      children: <Widget>[
        new Icon(Icons.select_all),
        new SizedBox(width: 30.0),
        new DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            })
      ],
    );
  }
}
