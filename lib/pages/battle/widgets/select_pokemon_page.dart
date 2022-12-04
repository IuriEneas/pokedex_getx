import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';
import 'package:pokedex_getx/services/helper.dart';

class SelectPokemonPage extends StatelessWidget {
  SelectPokemonPage({super.key});

  final controller = Get.find<BattleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: ListView.builder(
          itemCount: controller.myPokemonList.length,
          itemBuilder: (context, index) {
            final pokemon =
                PokemonHelper.convert(controller.myPokemonList[index]);
            return ListTile(
              onTap: () {
                Get.back(result: pokemon);
              },
              title: Text(pokemon.pokemonModel!.realName),
            );
          },
        ),
      ),
    );
  }
}
