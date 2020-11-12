import 'package:flutter/material.dart';

class LicPage extends StatelessWidget {

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


            
            image: NetworkImage('https://images.evisos.com.pe/2009/10/20/black-bull-licoreria_5102ead9ad_3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://i.pinimg.com/originals/fd/a7/52/fda752ac344381533a2d45f42c20c4aa.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://es.qoodis.com/wp-content/uploads/2019/10/inicio-de-una-tienda-de-licores-plantilla-de-plan-de-negocios-de-muestra.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}