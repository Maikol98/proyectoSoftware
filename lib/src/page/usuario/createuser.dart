import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:software/src/providers/negocio_provider.dart';
import 'package:software/src/providers/user_provider.dart';

class CreateUserPage extends StatefulWidget {
  CreateUserPage({Key key}) : super(key: key);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {

  ActivoFijoProvider activoFijoProvider = new ActivoFijoProvider();
  TextEditingController _carnet = TextEditingController();
  TextEditingController _nombre = TextEditingController();
  TextEditingController _apellido = TextEditingController();
  TextEditingController _direccion = TextEditingController();
  TextEditingController _telefono = TextEditingController();
  TextEditingController _correo = TextEditingController();
  TextEditingController _password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrase'),
        centerTitle: true,
      ),
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
        _inputCarnet(),
        SizedBox(height: 10.0,),
        _inputNombre(),
        SizedBox(height: 10.0),
        _inputApellido(),
        SizedBox(height: 10.0),
        _inputDireccion(),
        SizedBox(height: 10.0),
        _inputTelefono(),
        SizedBox(height: 10.0),
        _inputCorreo(),
        SizedBox(height: 10.0),
        _inputPassword(),
        SizedBox(height: 20.0),
        _button(),
      ],
    );
  }

  Widget _button(){
    return CupertinoButton(
      color: Theme.of(context).primaryColor,
      child: Text('REGISTRAR'),
      onPressed: () async{
        Map<String, dynamic> datos = {
          'carnet'    : _carnet.text,
          'nombre'    : _nombre.text,
          'apellido'  : _apellido.text,
          'direccion' : _direccion.text,
          'telefono'  : _telefono.text,
          'email'    : _correo.text,
          'password'  : _password.text
        };
        final dato = await activoFijoProvider.crearusuario(datos);
        Navigator.pushNamed(context, 'login');
      },
    );
  }

  Widget _inputCarnet(){
    return TextField(
      controller: _carnet,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.apps),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Carnet',
      ),
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
  
  Widget _inputApellido(){
    return TextField(
      controller: _apellido,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.perm_identity),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Apellido',
        hintText: 'fulanito'
      ),
    );
  }

  Widget _inputCorreo(){
    return TextField(
      controller: _correo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.alternate_email),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Correo',
        hintText: 'alguien@gmail.com'
      ),
    );
  }

  Widget _inputDireccion(){
    return TextField(
      controller: _direccion,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.directions),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Direccion',
      ),
    );
  }

  Widget _inputTelefono(){
    return TextField(
      controller: _telefono,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.phone),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Telefono',
      ),
    );
  }

  Widget _inputPassword(){
    return TextField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.lock),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0)
        // ),
        labelText: 'Password',
      ),
    );
  }

}