

class LoginRequestModel {
LoginRequestModel({
required this.usuario,
required this.password,
});
late final String usuario;
late final String password;

LoginRequestModel.fromJson(Map<String, dynamic> json){
usuario = json['usuario'];
password = json['password'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['usuario'] = usuario;
  _data['password'] = password;
  return _data;
}
}