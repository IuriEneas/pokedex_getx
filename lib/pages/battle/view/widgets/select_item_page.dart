import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokeball_model.dart';

class SelectItemPage extends StatelessWidget {
  SelectItemPage({super.key});

  final pokeballList = [
    PokeballModel(
      name: 'pokeball',
      captureRate: 70,
    ),
    PokeballModel(
      name: 'greatball',
      captureRate: 90,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(pokeballList[index].name),
              onTap: () {
                Get.back(result: pokeballList[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
