
class Negocios{

  List<Negocio> items = new List();
  Negocios();

  Negocios.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final negocio = new Negocio.fromJsonMap(item);
      items.add(negocio);
    }
  }
}

class Negocio {
  int id;
  String nombre;
  String descripcion;
  int buscasocio;
  int estado;
  int idCategoria;
  int idPersona;

  Negocio({
    this.id,
    this.nombre,
    this.descripcion,
    this.buscasocio,
    this.estado,
    this.idCategoria,
    this.idPersona,
  });

  Negocio.fromJsonMap( Map<String, dynamic> json){
    id          = json['id'];    
    nombre      = json['nombre'];
    descripcion = json['descripcion'];
    buscasocio  = json['buscasocio'];
    estado      = json['estado'];
    idCategoria = json['id_categoria'];  
    idPersona   = json['id_persona'];
  }
}
