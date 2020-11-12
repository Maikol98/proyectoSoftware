import 'package:flutter/material.dart';

class GymPage extends StatelessWidget {

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
            height: 300,
            width: 200,
            image: NetworkImage('https://m.dw.com/image/53396004_101.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://www.elcomercio.com/files/content_thumbnail_large/uploads/2020/05/27/5ecf02510874b.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2020/05/12/gimnasio-con-elipticas.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}