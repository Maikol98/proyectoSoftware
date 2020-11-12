import 'package:flutter/material.dart';
import 'package:software/src/page/galeria/galeria.dart';
import 'package:software/src/page/galeria/galeriaPan.dart';
import 'package:software/src/page/galeria/gym.dart';
import 'package:software/src/page/galeria/lic.dart';
import 'package:software/src/page/home.dart';
import 'package:software/src/page/login.dart';
import 'package:software/src/page/negocio/listarNegocios.dart';
import 'package:software/src/page/negocio/negocio.dart';
import 'package:software/src/page/negocio/registrarnegocio.dart';
import 'package:software/src/page/negocio/socio.dart';
import 'package:software/src/page/servicios/gymservicio.dart';
import 'package:software/src/page/servicios/newservicio.dart';
import 'package:software/src/page/servicios/servicios.dart';
import 'package:software/src/page/usuario/createuser.dart';
import 'package:software/src/page/visual/predict.dart';
import 'package:software/src/preferencias_usuario/preferecias_usuario.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.codigoUsuario);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login'         : (BuildContext context)=>LoginPage(),
        'home'          : (BuildContext context)=>HomePage(),
        'createUser'    : (BuildContext context)=>CreateUserPage(),
        'negociocreate' : (BuildContext context)=>RegistrarNegocio(),
        'listarNegocio' : (BuildContext context)=>ListarNegociosPage(),
        'panaderia'     : (BuildContext context)=>PanaderiaPage(),
        'restaurante'   : (BuildContext context)=>RestaurantePage(),
        'fotos'         : (BuildContext context)=>GaleriaPage(),
        'fotopan'       : (BuildContext context)=>GaleriaPanPage(),
        'servicio'      : (BuildContext context)=>ServiciosPage(),
        'gimnasio'      : (BuildContext context)=>GymServPage(),
        'licoreria'     : (BuildContext context)=>LicoreriaPage(),
        'fotosgym'      : (BuildContext context)=>GymPage(),
        'fotoslic'      : (BuildContext context)=>LicPage(),
        'predict'       : (BuildContext context)=>PredictPage(),
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(8, 89, 114,1),
      ),
    );
  }
}
