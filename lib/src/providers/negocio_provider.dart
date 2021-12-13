import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:software/src/models/Negocio_model.dart';
// import 'package:software/src/preferencias_usuario/preferecias_usuario.dart';

class UsuarioProvider{
  // final _prefs = new PreferenciasUsuario();
  String _url = 'radiant-savannah-77285.herokuapp.com';
  
  //Gestionar Usuario
  Future<List<Negocio>> todos(int carnet) async{
    final url = Uri.https(_url, 'api/todos/$carnet');

    final resp = await http.post(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Negocios.fromJsonList(decodeData);
    return usuario.items;
  }
  
  //create
  Future crearNegocio(Map<String, dynamic> datos) async{
    final url = Uri.https(_url, 'api/Negocio');

    final resp = await http.post(url,body: datos);

    final decodeData = json.decode(resp.body);
    final negocio = new Negocio.fromJsonMap(decodeData);
    return negocio;
  }

  Future activarSocio(int idNegocio) async{
    final url = Uri.https(_url, 'api/ActivarSocio/$idNegocio');

    final resp = await http.post(url);

    final decodeData = json.decode(resp.body);
    return decodeData;
  }

    Future<List<Negocio>> index() async{
    final url = Uri.https(_url, 'api/Negocio');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Negocios.fromJsonList(decodeData);
    return usuario.items;
  }

  // //edit
  // Future<Respuesta> editUsuario(int codigo, Map<String,dynamic> datos) async{
  //   final url = Uri.https(_url, 'api/UsuarioMovil/$codigo');

  //   final resp = await http.put(url,body: datos);
  //   final decodeData = json.decode(resp.body);
  //   final usuario = new Respuesta.fromJsonMap(decodeData);
  //   return usuario;
  // }

  // //eliminar
  //  Future<Respuesta> deleteUsuario(int codigo) async{
  //   final url = Uri.https(_url, 'api/Eliminar/$codigo');

  //   final resp = await http.put(url,body:{
  //     'idUsuario' : _prefs.codigoUsuario.toString(),
  //   });
  //   final decodeData = json.decode(resp.body);
  //   final usuario = new Respuesta.fromJsonMap(decodeData);
  //   return usuario;
  // }

}