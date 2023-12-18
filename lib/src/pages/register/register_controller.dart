import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/user_register.dart';
import 'package:flutter_app/src/services/access_point.dart';

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

  void registerUser() async {
    final UserRegister userRegister = UserRegister(
        firstName: firstNameTxController.text.trim(),
        lastName: lastNameTxController.text.trim(),
        email: emailTxController.text.trim(),
        identification: int.parse(identificationTxController.text.trim()),
        password: passwordTxController.text.trim(),
        confirmPassword: passConfirmTxController.text.trim());

    // ignore: invalid_return_type_for_catch_error
    final response = await AccessPoint.register(userRegister).catchError(print);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    anchorLoginPage();
  }
}
