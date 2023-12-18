import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/src/models/cliente.dart';
import 'package:flutter_app/src/models/types.dart';
import 'package:flutter_app/src/pages/dash/dash_controller.dart';
import 'package:flutter_app/src/utils/dialog_alert.dart';
import 'package:flutter_app/src/utils/my_colors.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _Dashpage();
}

class _Dashpage extends State<DashPage> {
  DashController dashController = DashController();
  ScreenArguments? args;

  Future<List<Cliente>> _initListClient() async {
    final List<Cliente> listClients = await dashController.searchClientes();
    return listClients;
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      dashController.init(context);
    });
  }

  @override
  void dispose() {
    dashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    dashController.setArguments(arguments);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dash Principal'),
          backgroundColor: MyColors.primaryColor,
        ),
        // ignore: unnecessary_brace_in_string_interps
        body: FutureBuilder<List<Cliente>>(
          future: _initListClient(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // La consulta aún no ha terminado
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Ocurrió un error
              return const Center(child: Text('Ocurrió un error'));
            } else {
              // La consulta se realizó correctamente
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].firstName),
                    subtitle: Text(snapshot.data![index].lastName),
                  );
                },
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_loadClientes(), _buttonSearchClientes()])));
  }

  Widget _buttonSearchClientes() {
    return ElevatedButton(
        onPressed: () {
          dashController.searchClientes().then((clientes) {
            final int sizeList = clientes.length;
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialogWidget(
                  titulo: 'Alerta',
                  contenido: 'Este es un mensaje de notificación',
                  acciones: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('La consulta se realizo con éxito $sizeList'),
                    ),
                  ],
                );
              },
            );
          });
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
            backgroundColor: MyColors.primaryColor),
        child: const Text('2 Consultar'));
  }

  Widget _loadClientes() {
    return ElevatedButton(
        onPressed: () {
          dashController.loadClientes().then((response) {
            final int status = response.statusCode;
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialogWidget(
                  titulo: 'Alerta',
                  contenido: 'Este es un mensaje de notificación',
                  acciones: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:
                          Text('El cargue se se realizo con estado: $status'),
                    ),
                  ],
                );
              },
            );
          });
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
            backgroundColor: MyColors.primaryColor),
        child: const Text('1 Cargar Clientes'));
  }
}
