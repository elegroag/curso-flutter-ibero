import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/access_point.dart';
import 'package:http/http.dart' as http;

class LoginController {
  LoginController();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  late BuildContext context;

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  void anchorRegisterPage() {
    Navigator.of(context).pushNamed(
      'register',
    );
  }

  void accessToken() {
    // ignore: unnecessary_lambdas
    AccessPoint.token(emailTextController.text, passwordTextController.text)
        .then((http.Response value) => {
              Navigator.of(context)
                  .pushNamed('dash', arguments: emailTextController.text)
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError(print);
  }

  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
  }
}
