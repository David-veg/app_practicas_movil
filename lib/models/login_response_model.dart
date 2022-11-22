import 'dart:convert';
LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
LoginResponseModel({
required this.message,
required this.data,
});
late final String message;
late final Data data;

LoginResponseModel.fromJson(Map<String, dynamic> json){
message = json['message'];
data = Data.fromJson(json['data']);
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['message'] = message;
  _data['data'] = data.toJson();
  return _data;
}
}

class Data {
  Data({
    required this.usuario,
    required this.idRol,
    required this.token,
  });
  late final String usuario;
  late final String idRol;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    usuario = json['usuario'];
    idRol = json['id_rol'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['usuario'] = usuario;
    _data['id_rol'] = idRol;
    _data['token'] = token;
    return _data;
  }
}