class Usuarios{
  List<Usuario> items = new List();
  Usuarios();

  Usuarios.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList) {
      final usuario = new Usuario.fromJsonMap(item);
      items.add(usuario);
    }
  }

}



class Usuario {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic password;
  dynamic rememberToken;
  String createdAt;
  String updatedAt;
  int idPersona;

  Usuario({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.idPersona,
  });

  Usuario.fromJsonMap( Map<String, dynamic> json){
    id              = json['id'];
    name            = json['name'];
    email           = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password        = json['password'];
    rememberToken   = json['remember_token'];
    createdAt       = json['created_at'];
    updatedAt       = json['updated_at'];
    idPersona       = json['id_persona'];
  }
}