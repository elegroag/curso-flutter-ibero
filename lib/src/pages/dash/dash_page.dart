import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/my_colors.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? name = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dash Principal'),
          backgroundColor: MyColors.primaryColor,
        ),
        // ignore: unnecessary_brace_in_string_interps
        body: Center(child: Text('Bienvenido Usuario ${name}')));
  }
}
