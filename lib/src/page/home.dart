import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software/src/widget/menu.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PITCH'),
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
        child: Center(
          child: Column(
              children: [
                SizedBox(height: 20,),
                Text("¡BIENVENIDO!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://previews.123rf.com/images/sparkdesign/sparkdesign1112/sparkdesign111200141/11740397-hombre-de-negocios-en-el-fondo-empresarial-en-se%C3%B1al-de-bienvenida-plantean.jpg'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Bienvenido a nuestra apliacion movil donde usted podra averiguar sobre la viabilidad de su emprendimiento, para acceder a mas servicios puede crearse una cuenta PREMIUM donde ahi usded podra ofrecer los servicios de su emprendimiento a travez de nuesta publicacion.",
                      style: TextStyle(fontSize:17)
                    )
                ),
                CupertinoButton(
                  // padding: EdgeInsets.symmetric(horizontal:50),
                  color: Colors.grey,
                  child: Text("CAMBIARSE A PREMIUM"), 
                  onPressed: () {},
                )
              ],  
            ),
          ),
      ),
    );
  }
}