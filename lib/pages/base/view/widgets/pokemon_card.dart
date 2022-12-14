import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/routes/page_routes.dart';
import 'package:pokedex_getx/services/utils_services.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          PagesRoute.pokemonRoute,
          arguments: pokemon,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: PokemonTypeColor.pokemonType(pokemon.types![0].type!.name!)
                .withAlpha(150),
            border: const Border(
              bottom: BorderSide(width: 1, color: Colors.black),
              left: BorderSide(width: 1, color: Colors.black),
              right: BorderSide(width: 1, color: Colors.black),
              top: BorderSide(width: 1, color: Colors.black),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ID detail
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withAlpha(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(UtilsServices.verifyText(pokemon.id!)),
                ),
              ),

              // Pokemon Img
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: pokemon.name!,
                  child: Image.network(
                    pokemon.sprites!.other!.officialArtWork!.frontDefault
                        as String,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),

              // Pokemon Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(pokemon.realName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
