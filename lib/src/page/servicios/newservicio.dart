import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';

class LicoreriaPage extends StatefulWidget {
  LicoreriaPage({Key key}) : super(key: key);

  @override
  _LicoreriaPageState createState() => _LicoreriaPageState();
}

class _LicoreriaPageState extends State<LicoreriaPage> {
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
          _buton(),
          _crearCajaComentario(),
    
        ],
      ),
    );
  }

  Widget _posterTitulo(){
    return Image(
      image: NetworkImage('https://2.bp.blogspot.com/-MLz2ZfYwYIM/VrTYchtuPmI/AAAAAAAAACk/lu3NwGlreJA/s1600/Licorea.jpg'),
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
          Text('Licorería es el lugar donde se fabrican licores y los diversos establecimientos donde se pueden consumir o adquirir bebidas alcohólicas. En Chile son llamados "botillerías". El equivalente estadounidense es el liquor store'),
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

  Widget _buton(){
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