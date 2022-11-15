import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';

import 'base/view/widgets/pokemon_card.dart';

class QueryPage extends StatelessWidget {
  QueryPage({super.key});

  final List<PokemonModel> list = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<BaseController>(
              builder: (controller) {
                return Expanded(
                  child: list.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              print(list.length);
                              return PokemonCard(
                                pokemon: list[index],
                              );
                            },
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.search_off, size: 180),
                            Text(
                              'Nenhum pokémon foi encontrado',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 36),
                            )
                          ],
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
