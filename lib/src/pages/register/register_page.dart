import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/src/pages/register/register_controller.dart';
import 'package:flutter_app/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  RegisterController registerController = RegisterController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registerController.init(context);
    });
  }

  @override
  void dispose() {
    registerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            Positioned(top: 60, left: 25, child: _textRegister()),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _imageBanner(),
                  _textIdentification(),
                  _textFirstName(),
                  _textLastName(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _textConfirmPassword(),
                  _buttonRegister(),
                  _textDontHaveAccount()
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget _textRegister() {
    return const Text(
      'REGISTER',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
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

  Widget _textIdentification() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
            color: MyColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Identificación',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryColorDark,
            ),
            prefixIcon: Icon(
              Icons.person_sharp,
              color: MyColors.primaryColorDark,
            ),
          ),
          controller: registerController.identificationTxController,
        ));
  }

  Widget _textFirstName() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
            color: MyColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Nombres',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryColorDark,
            ),
            prefixIcon: Icon(
              Icons.person,
              color: MyColors.primaryColorDark,
            ),
          ),
          controller: registerController.firstNameTxController,
        ));
  }

  Widget _textLastName() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
            color: MyColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Apellidos',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryColorDark,
            ),
            prefixIcon: Icon(
              Icons.person,
              color: MyColors.primaryColorDark,
            ),
          ),
          controller: registerController.lastNameTxController,
        ));
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
          controller: registerController.emailTxController,
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
        controller: registerController.passwordTxController,
      ),
    );
  }

  Widget _textConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar el Password',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            helperStyle: TextStyle(
              color: MyColors.primaryColorDark,
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColorDark,
            )),
        controller: registerController.passConfirmTxController,
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        child: ElevatedButton(
            onPressed: registerController.registerUser,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
                backgroundColor: MyColors.primaryColor),
            child: const Text('Registrarse')));
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 6,
        ),
        GestureDetector(
          onTap: registerController.anchorLoginPage,
          child: Text(
            'Volver intentar login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
                height: 5,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
