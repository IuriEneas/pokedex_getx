import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_capturable_model.dart';
import 'package:pokedex_getx/routes/page_routes.dart';

class MyPokemonTile extends StatelessWidget {
  const MyPokemonTile({super.key, required this.pokemon});

  final PokemonCapModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(PagesRoute.myPokemonRoute, arguments: pokemon);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: PokemonTypeColor.pokemonType(
                      pokemon.pokemonModel!.types![0].type!.name!)
                  .withAlpha(120),
            ),
            child: Column(
              children: [
                Image.network(
                  pokemon.pokemonModel!.sprites!.frontDefault!,
                  fit: BoxFit.cover,
                ),
                Text(pokemon.pokemonModel!.name!),
                Text('Lvl: ${pokemon.level}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
