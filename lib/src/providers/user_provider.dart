import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:software/src/models/usuario_model.dart';
import 'package:software/src/preferencias_usuario/preferecias_usuario.dart';




class ActivoFijoProvider{

  String _url = 'radiant-savannah-77285.herokuapp.com';
  final _prefs = new PreferenciasUsuario();
  
  //LOGIN
  Future<int> login(user, pass) async{
    final url = Uri.https( _url , 'api/login');

    final resp = await http.post(url, body: {
      'email' : user,
      'password' : pass
    });

    final decodeData = json.decode(resp.body);
    if ( decodeData == 0 ) {
      return 0;
    }else{
      final usuario = new Usuario.fromJsonMap(decodeData);
      _prefs.correo = usuario.email;
      _prefs.nombre = usuario.name;
      _prefs.codigoUsuario = usuario.id;
      return 1;
    }
  }

  Future crearusuario(Map<String, dynamic> datos) async{
    final url = Uri.https(_url, 'api/Persona');

    final resp = await http.post(url,body: datos);

    final decodeData = json.decode(resp.body);
    return 1;
  }

}