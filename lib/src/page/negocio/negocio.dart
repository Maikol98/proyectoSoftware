import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class RestaurantePage extends StatefulWidget {
  const RestaurantePage({Key key}) : super(key: key);

  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  bool _valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurante Victoria'),
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
      image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/11/05/bb/dd/fachada-do-restaurante.jpg'),
    );
  }

  Widget _descripcion(){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Nombre Propietario: Jose', 
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text('Numero telefonico: 75544119', 
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
          Text('¡Somos los de siempre! Si aún no nos conoces te gustará saber que el restaurante del hotel es un referente en la zona porque tenemos la mejor huerta riojana y una oferta variada de productos típicos de nuestra tierra. Prueba nuestro menú del día y empápate de la mejor gastronomía del Victoria.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Desea habilitar el buscar Socio?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Switch(
                value: _valor,
                onChanged: (value) {
                  setState(() {
                  });
                  _valor = value;
                },
              ),
            ],
          )
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
          Navigator.pushNamed(context, 'fotos');
        },
      ),
    );
  }


}