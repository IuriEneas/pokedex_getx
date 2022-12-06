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
          // Outside container decoration
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Container(
            // Main container decoration
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: PokemonTypeColor.pokemonType(
                      pokemon.pokemonModel!.types![0].type!.name!)
                  .withAlpha(120),
              border: const Border(
                bottom: BorderSide(width: 1, color: Colors.black),
                left: BorderSide(width: 1, color: Colors.black),
                right: BorderSide(width: 1, color: Colors.black),
                top: BorderSide(width: 1, color: Colors.black),
              ),
            ),

            // Tile Data
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pokemon Image
                Image.network(
                  pokemon.pokemonModel!.sprites!.frontDefault!,
                  fit: BoxFit.contain,
                ),

                // Pokemon name
                Text(pokemon.pokemonModel!.realName),

                // Pokemon level
                Text('Lvl: ${pokemon.level}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
