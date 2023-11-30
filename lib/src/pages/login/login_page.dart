import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/my_colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class AccessPoint {
  static Future<http.Response> token(String email, String password) async {
    final data = '${email}:${password}';
    print(data);
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return await http.get(Uri.parse(
        'https://locahost:3000/api/auth/token?data=${stringToBase64.encode(data)}'));
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  void _accessToken(BuildContext context) {
    // ignore: unnecessary_lambdas
    AccessPoint.token(emailTextController.text, passwordTextController.text)
        .then((http.Response value) => {
              Navigator.of(context)
                  .pushNamed('dash', arguments: emailTextController.text)
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError(print);
  }

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        ///Positioned(child: child),
        Positioned(top: -80, left: -100, child: _circleLogin()),

        ///Positioned(child: child),
        Positioned(top: 60, left: 25, child: _textLogin()),
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _imageBanner(),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonLogin(),
                _textDontHaveAccount()
              ]),
        ),
      ]),
    ));
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor,
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget _textFieldEmail() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
            color: MyColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
            decoration: InputDecoration(
              hintText: 'Correo electronico',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(15),
              hintStyle: TextStyle(
                color: MyColors.primaryColorDark,
              ),
              prefixIcon: Icon(
                Icons.email,
                color: MyColors.primaryColorDark,
              ),
            ),
            controller: emailTextController));
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            helperStyle: TextStyle(
              color: MyColors.primaryColorDark,
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColorDark,
            )),
        controller: passwordTextController,
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        child: ElevatedButton(
            onPressed: () {
              _accessToken(context);
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
                backgroundColor: MyColors.primaryColor),
            child: const Text('Ingresar')));
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style:
              TextStyle(color: MyColors.primaryColor, height: 5, fontSize: 16),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          'Registrate',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
              height: 5,
              fontSize: 16),
        )
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 150, bottom: MediaQuery.of(context).size.height * 0.05),
      child: Image.asset(
        'img/logo_flutter.jpg',
        width: 240,
        height: 60,
      ),
    );
  }
}
