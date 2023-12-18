## Recurso list view

```dart
import 'package:flutter/material.dart';

class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  Future<List<Cliente>> _getClientes() async {
    // Simulamos una consulta a la base de datos
    return [
      Cliente(id: 1, nombre: "Juan Pérez", email: "juan@perez.com"),
      Cliente(id: 2, nombre: "María López", email: "maria@lopez.com"),
      Cliente(id: 3, nombre: "Pedro Sánchez", email: "pedro@sanchez.com"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
      ),
      body: FutureBuilder<List<Cliente>>(
        future: _getClientes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // La consulta aún no ha terminado
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Ocurrió un error
            return Center(child: Text("Ocurrió un error"));
          } else {
            // La consulta se realizó correctamente
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].nombre),
                  subtitle: Text(snapshot.data[index].email),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Cliente {
  int id;
  String nombre;
  String email;

  Cliente({this.id, this.nombre, this.email});
}

```

## Recurso 2 footer con botones y alert

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
      ),
      body: FutureBuilder<List<Cliente>>(
        future: _getClientes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // La consulta aún no ha terminado
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Ocurrió un error
            return Center(child: Text("Ocurrió un error"));
          } else {
            // La consulta se realizó correctamente
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].nombre),
                  subtitle: Text(snapshot.data[index].email),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Botón para mostrar una alerta
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alerta"),
                      content: Text("Este es un mensaje de alerta"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Alerta"),
            ),
            // Botón para mostrar una alerta con un botón adicional
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alerta"),
                      content: Text("Este es un mensaje de alerta"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancelar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Alerta con botón adicional"),
            ),
          ],
        ),
      ),
    );
  }

```

```dart
class AlertDialogWidget extends StatelessWidget {
  final String titulo;
  final String contenido;
  final List<Widget> acciones;

  AlertDialogWidget({
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


//Files main
class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ...
            // Botón para mostrar la alerta
            TextButton(
              onPressed: () {
                // Llamamos al showDialog con el widget AlertDialogWidget
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogWidget(
                      titulo: "Alerta",
                      contenido: "Este es un mensaje de alerta",
                      acciones: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Alerta"),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}

```

## consulta con dialog

```dart
class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  // ...

  Future<List<Cliente>> _getClientes() async {
    // Simulamos una consulta a la base de datos
    return [
      Cliente(id: 1, nombre: "Juan Pérez", email: "juan@perez.com"),
      Cliente(id: 2, nombre: "María López", email: "maria@lopez.com"),
      Cliente(id: 3, nombre: "Pedro Sánchez", email: "pedro@sanchez.com"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ...
            // Botón para mostrar la alerta
            TextButton(
              onPressed: () {
                // Llamamos al showDialog con el widget AlertDialogWidget
                // Luego de realizar la consulta asíncrona
                _getClientes().then((clientes) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        titulo: "Alerta",
                        contenido: "Este es un mensaje de alerta",
                        acciones: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Aceptar"),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
              child: Text("Alerta"),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}


showDialog(
  context: context,
  builder: (context) {
    return AlertDialogWidget(
      titulo: "Alerta",
      contenido: "Este es un mensaje de alerta",
      acciones: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Aceptar"),
        ),
      ],
    );
  },
);

```
