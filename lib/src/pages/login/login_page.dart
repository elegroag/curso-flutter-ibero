import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/src/pages/login/login_controller.dart';
import 'package:flutter_app/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      loginController.init(context);
    });
  }

  @override
  void dispose() {
    loginController.dispose();
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
          controller: loginController.emailTextController,
          keyboardType: TextInputType.emailAddress,
        ));
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
        controller: loginController.passwordTextController,
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        child: ElevatedButton(
            onPressed: loginController.accessToken,
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
        GestureDetector(
            onTap: loginController.anchorRegisterPage,
            child: Text(
              'Registrate',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor,
                  height: 5,
                  fontSize: 16),
            ))
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
