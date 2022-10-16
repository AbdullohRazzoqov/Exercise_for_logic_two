import 'dart:math';

import 'package:about_companies/data/data.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key, this.brand}) : super(key: key);
  Map<String, String>? brand;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.grey,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              brand!['name'].toString(),
              style: const TextStyle(color: Colors.black),
            ),
            background: Image.network(
              brand!['imageOriginal'].toString(),
              fit: BoxFit.cover,
            ),
          ),
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Card(
                child: ListTile(
                  minVerticalPadding: 20,
                  title: Text(
                    brand!['name'].toString(),
                    style: const TextStyle(fontSize: 35),
                  ),
                  subtitle: Text(
                    brand!['description'].toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoPage(
                        brand: brends[index],
                      ),
                    ),
                  );
                  
                },
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: Text(brends[(index = Random().nextInt(10))]['name'].toString()),
                    subtitle: Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(
                              brends[index]['imageCart'].toString(),
                            ),
                            fit: BoxFit.cover),
                      ),
                    )),
              ),
            );
          }), childCount: 3),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5),
        )
      ],
    );
  }
}
