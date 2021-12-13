import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class RegistrarNegocio extends StatefulWidget {
  RegistrarNegocio({Key key}) : super(key: key);

  @override
  _RegistrarNegocioState createState() => _RegistrarNegocioState();
}

class _RegistrarNegocioState extends State<RegistrarNegocio> {
  
  // TextEditingController _carnet = new TextEditingController();
  TextEditingController _nombre = new TextEditingController();
  TextEditingController _apellido = new TextEditingController();
  // TextEditingController _direccion = new TextEditingController();
  // TextEditingController _telefono = new TextEditingController();
  // TextEditingController _correo = new TextEditingController();
  // TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Negocio'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
           icon: Icon(Icons.exit_to_app),
           onPressed:() => Navigator.pushNamed(context, 'login'),
          ),
          
          SizedBox(width: 15.0)
        ],
      ),
      drawer: MenuWidget(),
      body: Container(
        margin: EdgeInsets.all(40.0),
        child: _formulario(),
      ),
    );
  }


  Widget _formulario(){
    return ListView(
      children: <Widget>[
        Text('FORMULARIO PARA REGISTRO',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),         
        ),
        SizedBox(height: 10.0),
        _inputNombre(),
        SizedBox(height: 10.0),
        _inputDescripcion(),
        SizedBox(height: 10.0),
        _inputCategoria(),
        SizedBox(height: 10.0),
        _button(),
      ],
    );
  }

  Widget _button(){
    return CupertinoButton(
      color: Theme.of(context).primaryColor,
      child: Text('REGISTRAR'),
      onPressed: () {
        
      },
    );
  }


  Widget _inputNombre(){
    return TextField(
      controller: _nombre,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.perm_identity),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Nombre',
        hintText: 'fulanito'
      ),
    );
  }
  
  Widget _inputDescripcion(){
    return TextField(
      maxLines: null,
      controller: _apellido,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.assignment),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Descripcion'
      ),
    );
  }

  Widget _inputCategoria(){
    return TextField(
      controller: _apellido,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.assignment_late),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Categoria'
      ),
    );
  }
}