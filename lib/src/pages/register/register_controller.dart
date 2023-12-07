import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/user_register.dart';
import 'package:flutter_app/src/services/access_point.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  RegisterController();

  TextEditingController emailTxController = TextEditingController();
  TextEditingController passwordTxController = TextEditingController();
  TextEditingController firstNameTxController = TextEditingController();
  TextEditingController lastNameTxController = TextEditingController();
  TextEditingController identificationTxController = TextEditingController();
  TextEditingController passConfirmTxController = TextEditingController();

  late BuildContext context;

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  void anchorLoginPage() {
    Navigator.of(context).pushNamed(
      'login',
    );
  }

  void dispose() {
    emailTxController.dispose();
    passwordTxController.dispose();
    firstNameTxController.dispose();
    lastNameTxController.dispose();
    identificationTxController.dispose();
    passConfirmTxController.dispose();
  }

  void registerUser() {
    final UserRegister userRegister = UserRegister(
        firstName: firstNameTxController.text.trim(),
        lastName: lastNameTxController.text.trim(),
        email: emailTxController.text.trim(),
        identification: int.parse(identificationTxController.text.trim()),
        password: passwordTxController.text.trim(),
        confirmPassword: passConfirmTxController.text.trim());

    AccessPoint.register(userRegister).then((http.Response response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      anchorLoginPage();
      // ignore: invalid_return_type_for_catch_error
    }).catchError(print);
  }
}
