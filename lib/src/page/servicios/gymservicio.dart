import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class GymServPage extends StatelessWidget {
  const GymServPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Licoreria El Cesar'),
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
      body:ListView(
        children: <Widget>[
          _posterTitulo(),
          _descripcion(),
          _buton(context),
          _crearCajaComentario(),
    
        ],
      ),
    );
  }

  Widget _posterTitulo(){
    return Image(
      image: NetworkImage('https://i.pinimg.com/originals/40/c2/77/40c27799838cb51779179b356680d349.jpg'),
    );
  }

  Widget _descripcion(){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Nombre Propietario: Cesar', 
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text('Numero telefonico: 76089920', 
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text('Estado: Activo', 
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10.0,),
          Text('Descripcion',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Text('Nuestro gimnasio cuenta con las más grandes y mejores salas de máquinas, pesas y equipamiento para el cuidado de tu salud.'),
        ],
      ),
    );
  }



  Widget _crearCajaComentario(){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text('Comentarios', style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }

  Widget _buton( BuildContext context){
    return Container(
      margin: EdgeInsets.all(10.0),
      child: CupertinoButton(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('Ver Fotos'),
          SizedBox(width: 10.0,),
          Icon(Icons.camera_alt)
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'fotoslic');
        },
      ),
    );
  }
}