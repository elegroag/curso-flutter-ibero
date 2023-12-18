import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String titulo;
  final String contenido;
  final List<Widget> acciones;

  const AlertDialogWidget({
    super.key,
    required this.titulo,
    required this.contenido,
    required this.acciones,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Text(contenido),
      actions: acciones,
    );
  }
}
