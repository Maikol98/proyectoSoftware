import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class ServiciosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios'),
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
      body: _listado(context)
    );
  }

  Widget _listado(BuildContext context){
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0) 
          ),
          child: Column(
            children: <Widget>[
              Image(                
                image: NetworkImage('https://www.hashplace.com/images/lugares/2013-10/victoria-panaderia-6986.jpg'),
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('PANADERIA VICTORIA'),
                onTap: () => Navigator.pushNamed(context, 'panaderia')
              ),
            ],
          ),
          color: Colors.grey,
        ),
        SizedBox(height: 15.0),
        Card(
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0) 
          ),
          child: Column(
            children: <Widget>[
              Image(                
                image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/11/05/bb/dd/fachada-do-restaurante.jpg'),
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('RESTAURANTE VICTORIA'),
                onTap: () => Navigator.pushNamed(context, 'restaurante')
              ),
            ],
          ),
          color: Colors.grey,
        ),
        SizedBox(height: 15.0),
        Card(
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0) 
          ),
          child: Column(
            children: <Widget>[
              Image(                
                image: NetworkImage('https://2.bp.blogspot.com/-MLz2ZfYwYIM/VrTYchtuPmI/AAAAAAAAACk/lu3NwGlreJA/s1600/Licorea.jpg'),
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('LICORERIA EL CESAR'),
                onTap: () => Navigator.pushNamed(context, 'licoreria')
              ),
            ],
          ),
          color: Colors.grey,
        ),
        SizedBox(height: 15.0),
        Card(
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0) 
          ),
          child: Column(
            children: <Widget>[
              Image(                
                image: NetworkImage('https://i.pinimg.com/originals/40/c2/77/40c27799838cb51779179b356680d349.jpg'),
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('GIMNASIO THE POWER'),
                onTap: () => Navigator.pushNamed(context, 'gimnasio')
              ),
            ],
          ),
          color: Colors.grey,
        ),
      ],
    );
  }
}