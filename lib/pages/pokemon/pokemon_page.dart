import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({super.key});

  final PokemonModel pokemonModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            pokemonModel.sprites.other.officialArtWork.frontDefault == null
                ? const CircularProgressIndicator()
                : Image.network(
                    pokemonModel.sprites.other.officialArtWork.frontDefault,
                    height: 300,
                    width: 300,
                  ),
            Expanded(
              child: Column(
                children: [
                  if (pokemonModel.types.length > 1) ...[
                    Text(pokemonModel.types[0].type.name),
                    Text(pokemonModel.types[1].type.name),
                  ] else ...[
                    Text(pokemonModel.types[0].type.name),
                  ],
                  Text(pokemonModel.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
