import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/preferencias_usuario/preferecias_usuario.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:software/src/providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final prefs = new PreferenciasUsuario();
  ActivoFijoProvider activoFijoProvider = new ActivoFijoProvider();
  bool _ocultarContra = true;
  IconData _iconoContra = Icons.lock_outline;
  TextEditingController _user = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _user.text = prefs.correo ;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          _loginCreate(),
        ],
      ),
      
    );
  }

    Widget _fondoApp(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(8, 89, 114,1),
    );

  }


  Widget _loginCreate(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 120, horizontal: 60),
      width: 350,
      height: 480,
      decoration: BoxDecoration(
        color: Color.fromRGBO(8, 158, 168, 0.4),
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: <Widget>[
          _imagenPerfil(),
          SizedBox(height: 20.0),
          _inputCorreo(),
          SizedBox(height: 10.0),
          _inputPassword(),
          SizedBox(height: 10.0),
          _opciones(),
          SizedBox(height: 15.0),
          _crearButton(),
        ],
      ),
    );
  }

  Widget _inputCorreo(){
    return TextField(
      controller: _user,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.mail_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        labelText: 'Email',
        hintText: 'alguien@gmail.com'
      ),
    );
  }

  Widget _inputPassword(){
    return TextField(
      controller: _password,
      obscureText: _ocultarContra,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_iconoContra),
          onPressed: () {
            if (_ocultarContra) {
              _iconoContra = Icons.lock_open;
              _ocultarContra = !_ocultarContra;
            }else{
              _iconoContra = Icons.lock_outline;
              _ocultarContra = !_ocultarContra;
            }
            setState(() {});
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: 'Password', 
      ),
    );
  }

  Widget _imagenPerfil(){
    return CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.blueGrey[100],
      child: Icon(Icons.person, size: 70.0, color: Colors.black,),
    );
  }

  Widget _crearButton(){
    return CupertinoButton(
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('INGRESAR'),
        Icon(Icons.keyboard_arrow_right)
        ],
      ),
      onPressed: () async{
        if( await activoFijoProvider.login(_user.text, _password.text) == 1 ){
          Navigator.pushNamed(context, 'home');
        }
      },
    );
 }

  Widget _opciones(){
    return Column(
      children: <Widget>[
        FlatButton(
          splashColor: Colors.white10,
          child: Text('REGISTRATE',
            style: TextStyle(
              decoration: TextDecoration.underline
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, 'createUser'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook, size: 40.0), 
              onPressed: () {
              
              },
            ),
            SizedBox(width: 15.0),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.google,size: 40.0), 
              onPressed: () {
                
              },
            ),
            SizedBox(width: 15.0),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram,size: 40.0), 
              onPressed: () {
                
              },
            )
          ],
        )
      ],
    );
  }
}