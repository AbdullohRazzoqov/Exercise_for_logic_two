import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key, this.brand}) : super(key: key);
  Map<String, String>? brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  brand!['imageOriginal'].toString(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                title: Text(
                  brand!['name'].toString(),
                ),
                subtitle: Text(
                  brand!['description'].toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ))
      ]),
    );
  }
}
