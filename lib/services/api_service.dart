import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_nutricion/models/login_request_model.dart';
import 'package:pro_nutricion/models/login_response_model.dart';
import 'package:pro_nutricion/services/config.dart';
import 'package:pro_nutricion/services/shared_service.dart';
class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async{
    Map<String, String> requestHeaders ={
      'Content-type':'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if(response.statusCode == 200){
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    }
    else {
      return false;
    }
  }
}