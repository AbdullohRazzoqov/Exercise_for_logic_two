import 'package:about_companies/data/data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      brends[index]['imageCart'].toString(),
                    ),
                  ),
                  title: Text(
                    brends[index]['name'].toString(),
                  ),
                  subtitle: Text(
                    brends[index]['budget'].toString(),
                  ),
                  trailing: const Icon(Icons.navigate_next_sharp),
                ),
              );
            },
            itemCount: brends.length,
          ),
        )
      ]),
    );
  }
}
