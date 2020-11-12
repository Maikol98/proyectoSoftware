import 'package:flutter/material.dart';

class GaleriaPage extends StatelessWidget {
  const GaleriaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotos'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: _galeria()
      ),
    );
  }


  Widget _galeria(){
    return ListView(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/0e/f9/6c/8a/salon.jpg'),
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage('https://www.restaurantevictoriamangu.com/wp-content/uploads/2019/03/restaurante-victoria-mangu-piscina-small.png'),
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage('https://www.restaurantevictoriamangu.com/wp-content/uploads/2019/03/restaurante-victoria-mangu-exterior-piscina.png'),
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage('https://sevilla.abc.es/gurme/wp-content/uploads/sites/24/2016/11/Victoria-8-1-960x540.jpg'),
          ),
        )
      ],
    );
  }
}