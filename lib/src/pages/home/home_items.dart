import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/city.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(city.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                city.title,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                city.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
