import 'package:flutter/material.dart';
import 'package:software/src/preferencias_usuario/preferecias_usuario.dart';


class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top:30),
            child: Column(
              children:<Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.blueGrey[100],
                  child: Icon(Icons.person, size: 60.0, color: Colors.black,)
                ),
                SizedBox(height: 10),
                Text(prefs.nombre)
              ], 
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
          ),
          ListTile(
            title: Text('SERVICIOS'),
            onTap: () => Navigator.pushNamed(context, 'servicio'),
          ),
          ListTile(
            title: Text('REGISTRAR UN NEGOCIO'),
            onTap: () => Navigator.pushNamed(context, 'negociocreate'),
          ),
          ListTile(
            title: Text('AQUI APLICAMOS LA IA'),
            onTap: () => Navigator.pushNamed(context, 'predict'),
          ),
          ListTile(
            title: Text('VER MI NEGOCIO'),
            onTap: () => Navigator.pushNamed(context, 'listarNegocio'),
          ),
          
        ],
      ),
    );
  }
}
