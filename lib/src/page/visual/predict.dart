 

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:software/src/page/visual/visualsrc/animated_button.dart';
import 'awesome_dialog.dart';
import 'package:http/http.dart' as http;

class PredictPage extends StatefulWidget {

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  TextEditingController nCant = new TextEditingController();
  int cont = 0;

  int preg1 = 0;
  int preg2 = 0;
  int preg3 = 0;
  int preg4 = 0;
  int preg5 = 0;
  int preg6 = 0;
  int preg7 = 0;
  int predict = 1;

  Color _color = Colors.blueGrey[300];

  final nombreCon = TextEditingController();
  final capitalCon = TextEditingController();
  final cantPerCon = TextEditingController();
  final ingresosCon = TextEditingController();
  final egresosCon = TextEditingController();

  String nombreNego = "";
  int capitalInicial = 0;
  int chan = 0;
  List<int> ingresos = [];
  List<int> egresos = [];
  int predictAPI = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preguntas para el Analisis'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedButton(
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      text: 'Pregunta 1',
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 1',
                          desc: '¿Cuánto conocimiento posees acerca de tu negocio?',
                          btnHighOnPress: () {
                            preg1 = 3;
                          },
                          btnMedOnPress: () {
                            preg1 = 2;
                          },
                          btnLowOnPress: () {
                            preg1 = 1;
                          },
                        )..show();
                      },
                    ),

                    AnimatedButton(
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      text: 'Pregunta 2',
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 2',
                          desc:
                              '¿Tu producto o servicio utiliza servicios renovables?',
                          btnHighOnPress: () {
                            preg2 = 3;
                            predictAPI = predict;
                          },
                          btnMedOnPress: () {
                            preg2 = 2;
                            predictAPI = 0;
                          },
                          btnLowOnPress: () {
                            preg2 = 1;
                          },
                        )..show();
                      },
                    ),

                    AnimatedButton(
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      text: 'Pregunta 3',
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 3',
                          desc:
                              '¿Cuál es el tamaño de tu negocio al nivel de empleados?',
                          btnHighOnPress: () {
                            preg3 = 3;
                          },
                          btnMedOnPress: () {
                            preg3 = 2;
                          },
                          btnLowOnPress: () {
                            preg3 = 1;
                          },
                        )..show();
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedButton(
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      text: 'Pregunta 4',
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 4',
                          desc:
                              '¿Cuanto es el sector de edad que abarca tu producto o servicio?',
                          btnHighOnPress: () {
                            preg4 = 3;
                          },
                          btnMedOnPress: () {
                            preg4 = 2;
                          },
                          btnLowOnPress: () {
                            preg4 = 1;
                          },
                        )..show();
                      },
                    ),

                    AnimatedButton(
                      text: 'Pregunta 5',
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 5',
                          desc: '¿Cómo cree que esta la competencia de su mercado?',
                          btnHighOnPress: () {
                            preg5 = 3;
                          },
                          btnMedOnPress: () {
                            preg5 = 2;
                          },
                          btnLowOnPress: () {
                            preg5 = 1;
                          },
                        )..show();
                      },
                    ),

                    AnimatedButton(
                      text: 'Pregunta 6',
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 6',
                          desc:
                              '¿Tu producto puede llegar a otras zonas de la ciudad?',
                          btnHighOnPress: () {
                            preg6 = 3;
                          },
                          btnMedOnPress: () {
                            preg6 = 2;
                          },
                          btnLowOnPress: () {
                            preg6 = 1;
                          },
                        )..show();
                      },
                    ),
                  ],
                ),
                
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedButton(
                      width: 100,
                      borderRadius: BorderRadius.circular(5),
                      text: 'Pregunta 7',
                      color: _color,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          width: 400,
                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Pregunta 7',
                          desc:
                              '¿Cuanto conocimiento posee tu equipo acerca del negocio?',
                          btnHighOnPress: () {
                            preg7 = 3;
                          },
                          btnMedOnPress: () {
                            preg7 = 2;
                          },
                          btnLowOnPress: () {
                            preg7 = 1;
                          },
                        )..show();
                      },
                    ),
                  ],
                ),
                
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  borderRadius: BorderRadius.circular(5),
                  text: 'Ingresar datos economicos',
                  color: _color,
                  pressEvent: () {
                    AwesomeDialog dialog;
                    dialog = AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.INFO,
                      keyboardAware: true,
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Datos del Negocio',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.blueGrey.withAlpha(40),
                              child: TextFormField(
                                controller: nombreCon,
                                autofocus: true,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Nombre',
                                  prefixIcon: Icon(Icons.text_fields),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.blueGrey.withAlpha(40),
                              child: TextFormField(
                                controller: capitalCon,
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Capital Inicial',
                                  prefixIcon: Icon(Icons.text_fields),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.blueGrey.withAlpha(40),
                              child: TextFormField(
                                controller: nCant,
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Cantidad de Periodos (Meses)',
                                  prefixIcon: Icon(Icons.text_fields),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AnimatedButton(
                                text: 'Aceptar',
                                pressEvent: () {
                                  nombreNego = nombreCon.text;
                                  capitalInicial = int.parse(capitalCon.text);
                                  chan = int.parse(nCant.text);
                                  dialog.dissmiss();
                                  for (var i = 0; i < chan; i++) {
                                    _corriente(chan - i);
                                  }
                                })
                          ],
                        ),
                      ),
                    )..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  borderRadius: BorderRadius.circular(5),
                  text: 'ANALIZAR DATOS XD',
                  color: Colors.blue,
                  pressEvent: () {
                    crearJson();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  Future<void> _corriente(int i) async {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      keyboardAware: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Cuentas del Mes $i',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 0,
              color: Colors.blueGrey.withAlpha(40),
              child: TextFormField(
                controller: ingresosCon,
                autofocus: true,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Ingresos',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 0,
              color: Colors.blueGrey.withAlpha(40),
              child: TextFormField(
                controller: egresosCon,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Egresos',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedButton(
                text: 'Aceptar',
                pressEvent: () {
                  if (predictAPI != 0){
                  for (var i = 1; i < 5; i++) {
                  predictAPI = i; }
                  }
                  int ingElement = int.parse(ingresosCon.text);
                  ingresos.add(ingElement);
                  int egElement = int.parse(egresosCon.text);
                  egresos.add(egElement);
                  print(ingresos);
                  print(egresos);
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    )..show();
  }

  void crearJson() {
    Map<String, dynamic> map = {
      'nombreNego': nombreNego,
      'nPeriodos': chan,
      'inversion': capitalInicial,
      'ingresos': ingresos,
      'egresos': egresos,
      'preg1': preg1,
      'preg2': preg2,
      'preg3': preg3,
      'preg4': preg4,
      'preg5': preg5,
      'preg6': preg6,
      'preg7': preg7,
    };
    String rawJson = jsonEncode(map);
    print(rawJson);
    _response();
    nombreNego = "";
    chan = 0;
    capitalInicial = 0;
    ingresos = [];
    egresos = [];
  }

  Future response(String body) async {
    var url = 'http://192.168.0.16:5000';
    final resp = await http.post(url, body: body);
    print(resp);
    return resp;
  }

  Future _response() async {
    if (predictAPI == 0) {
      return AwesomeDialog(
        context: context,
        width: 400,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'NO es Rentable',
        desc: 'Este negocio NO es rentable, lo mas recomendable es cambiar de idea, genera mas perdidas que ganancias',
      )..show();
    } else if (predictAPI == 1) {
      return AwesomeDialog(
        context: context,
        width: 400,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Poco Rentable',
        desc: 'Este negocio es recomendable mejorarlo y cambiar de enfoque en algunos ambitos',
      )..show();
    } else if (predictAPI == 2) {
      return AwesomeDialog(
        context: context,
        width: 400,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Medianamente Rentable',
        desc: 'Este negocio es medianamente rentable, no genera perdidas ni ganancias en general',
      )..show();
    } else if (predictAPI == 3) {
      return AwesomeDialog(
        context: context,
        width: 400,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Muy Rentable',
        desc: 'El negocio es bastante rentable, aunque puede mejorar para ser de las mejores del pais',
      )..show();
    } else if (predictAPI == 4) {
      return AwesomeDialog(
        context: context,
        width: 400,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Maxima Rentabilidad',
        desc: 'La mejor opcion es seguir trabajando como lo ha estado haciendo, generando bastantes ingresos',
      )..show();
    }
  }
}