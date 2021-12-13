import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class PanaderiaPage extends StatefulWidget {
  PanaderiaPage({Key key}) : super(key: key);

  @override
  _PanaderiaPageState createState() => _PanaderiaPageState();
}

class _PanaderiaPageState extends State<PanaderiaPage> {
  bool _valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panaderia Victoria'),
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
      body:CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _posterTitulo(),
                _descripcion(),
                _buton(),
                _crearCajaComentario(),
              ]
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.black,
          ),
        onPressed: () => Navigator.pushNamed(context, 'predict')),
    );
  }

  Widget _posterTitulo(){
    return Image(
      image: NetworkImage('https://www.hashplace.com/images/lugares/2013-10/victoria-panaderia-6986.jpg'),
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
          Navigator.pushNamed(context, 'fotopan');
        },
      ),
    );
  }
}