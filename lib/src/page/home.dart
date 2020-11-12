import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Socio'),
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          height: double.infinity,
          width: double.infinity,


          
          image: NetworkImage('https://i.pinimg.com/originals/4a/db/fd/4adbfd4f4af0097c259792224d24da65.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}