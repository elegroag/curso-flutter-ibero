import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/src/models/city.dart';
import 'package:flutter_app/src/pages/home/details.dart';
import 'package:flutter_app/src/pages/home/home_items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class FindData {
  static Future<http.Response> load() async {
    return await http
        .get(Uri.parse('https://api.npoint.io/5ecaa20ebea4d86084e5'));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List? _dataList;

  void _incrementCounter() {
    FindData.load().then((data) => {
          setState(() {
            _dataList = jsonDecode(data.body);
            _dataList!.removeAt(2);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('hello'),
        ),
      ),
      body: Center(
          child: _dataList != null
              ? PageView.builder(
                  itemCount: _dataList?.length,
                  itemBuilder: (context, index) {
                    final item = _dataList?[index];
                    final image = item['image'];
                    final title = item['name'];
                    final description = item['description'];
                    final city = City(
                        image: image, title: title, description: description);
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(city: city)),
                          );
                        },
                        child: HomeItem(city: city));
                  }, // ListView.builder
                )
              : const Center(child: Text('Presionar el boton de +'))),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
