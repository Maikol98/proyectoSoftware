
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  get codigoUsuario {
    return _prefs.getInt('id') ?? '';
  }

  set codigoUsuario( int value ) {
    _prefs.setInt('id', value);
  }
  

  // GET y SET nombre
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre( String value ) {
    _prefs.setString('nombre', value);
  }
  // Correo
  get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo( String value ) {
    _prefs.setString('correo', value);
  }

}