import 'package:flutter/material.dart';
import 'package:pro_nutricion/models/login_request_model.dart';
import 'package:pro_nutricion/services/api_service.dart';
import 'package:pro_nutricion/services/config.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFromKey = GlobalKey<FormState>();
  String? usuario;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(2, 48, 82, 1),
        body: Center(

          child: Column(

            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FormHelper.inputFieldWidget(
                context,
                "usuario",
                "usuario",
                    (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Username can\'t be empty.';
                  }

                  return null;
                },
                    (onSavedVal) => {
                      usuario = onSavedVal,
                },

                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
              ),
              SizedBox(
                height: 15,
              ),
              FormHelper.inputFieldWidget(
                context,
                "password",
                "password",
                    (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Host URL can\'t be empty.';
                  }

                  return null;
                },
                    (onSavedVal) => {
                  password = onSavedVal,
                },

                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              ),
              SizedBox(

                height: 15,
              ),

              FormHelper.submitButton(
                "Login",
                    () {
                      if(validateAndSave()) {
                        setState(() {
                          isAPIcallProcess = true;
                        });
                        LoginRequestModel model= LoginRequestModel(
                            usuario: usuario!,
                            password: password!,
                        );
                        APIService.login(model).then((response) {
                          setState(() {
                            isAPIcallProcess = false;
                          });
                          if(response){
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/create-users',
                                    (route) => false
                            );
                          }
                          else{
                            FormHelper.showSimpleAlertDialog(
                                context,
                                Config.appName,
                                "Usuario/Contraseña Incorrecta",
                                "OK",
                                    (){
                                    Navigator.pop(context);
                                    },
                            );
                          }
                        });
                      }
                },
                btnColor: HexColor("#F8A900"),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10,
              ),
              SizedBox(
                height: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }
  bool validateAndSave(){
    final form = globalFromKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }


}