import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/types.dart';
import 'package:flutter_app/src/services/access_point.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController {
  LoginController();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  List<SecItem> _items = [];

  late BuildContext context;

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  void anchorRegisterPage() {
    Navigator.of(context).pushNamed(
      'register',
    );
  }

  void accessToken() async {
    final credenciales = Credenciales();
    credenciales.password = passwordTextController.text;
    credenciales.email = emailTextController.text;

    final response = await AccessPoint.token(credenciales);
    print(response);
    await stAddNewItem('token', response.token);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed('dash',
        arguments: ScreenArguments(emailTextController.text, response.token));
  }

  Future<void> stAddNewItem(String key, value) async {
    await _storage.write(key: key, value: value);
  }

  Future<List<SecItem>> readAll() async {
    final all = await _storage.readAll();
    _items = all.entries
        .map((entry) => SecItem(entry.key, entry.value))
        .toList(growable: false);
    return _items;
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
  }
}
