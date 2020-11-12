import 'package:flutter/material.dart';

class GaleriaPanPage extends StatelessWidget {
  const GaleriaPanPage({Key key}) : super(key: key);

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
            image: NetworkImage('https://www.hashplace.com/images/lugares/2013-10/victoria-panaderia-6986.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://www.guatemala.com/fotos/201706/Panaderia-Victoria2-885x500.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://b.zmtcdn.com/data/pictures/8/16954118/3d6d65ee3eb30968d10706670a62be0e_featured_v2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            height: 300,
            width: 200,
            image: NetworkImage('https://fastly.4sqi.net/img/general/600x600/5985020_AzivV8Q24S5m87VAlZbfk9hmI4rYbN2z5lOfByHVez0.jpg'),
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}