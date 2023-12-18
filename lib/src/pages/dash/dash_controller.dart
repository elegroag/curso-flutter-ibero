import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cliente.dart';
import 'package:flutter_app/src/models/types.dart';
import 'package:flutter_app/src/services/access_point.dart';
import 'dart:convert';

import 'package:http/http.dart';

class DashController {
  DashController();

  ScreenArguments? arguments;

  List<Cliente>? listClientes = [];

  late BuildContext context;

  // ignore: use_setters_to_change_properties
  void setArguments(ScreenArguments argument) {
    // ignore: unnecessary_this
    this.arguments = argument;
  }

  ScreenArguments? getArguments() {
    // ignore: unnecessary_this
    return this.arguments;
  }

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  Future<List<Cliente>> searchClientes() async {
    final response = await AccessPoint.listClientes(arguments!.token);
    final res = jsonDecode(response.body) as Map<String, dynamic>;

    for (final cliente in res['data']) {
      listClientes?.add(Cliente(
          cliente['id'],
          cliente['cedclie'],
          cliente['tipdoc'].toString(),
          cliente['first_name'].toString(),
          cliente['last_name'].toString(),
          cliente['codstat'].toString(),
          cliente['email'].toString(),
          cliente['phone'].toString(),
          cliente['create_as'].toString(),
          cliente['update_as'].toString()));
    }
    return Future.value(listClientes);
  }

  Future<Response> loadClientes() async {
    final response = await AccessPoint.loadClientes(arguments!.token);
    final res = jsonDecode(response.body) as Map<String, dynamic>;
    print(res);
    return Future.value(response);
  }

  void dispose() {}
}
