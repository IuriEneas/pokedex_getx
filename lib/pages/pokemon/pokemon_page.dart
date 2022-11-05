import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({super.key});

  final PokemonModel pokemonModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: PokemonTypeColor.pokemonType(
            pokemonModel.types[0].type.name,
          ).withAlpha(170),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pokemon image
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: 270,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(135),
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                    ),
                    Image.network(
                      pokemonModel.sprites.other.officialArtWork.frontDefault,
                      height: 300,
                      width: 300,
                    ),
                  ],
                ),
              ),

              // Pokemon Data
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Pokemon id
                    _typeWidget("#00${pokemonModel.id.toString()}"),

                    // Pokemon Name
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        pokemonModel.name,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 60,
                        ),
                      ),
                    ),

                    // Pokemon types
                    if (pokemonModel.types.length > 1) ...[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _typeWidget(pokemonModel.types[0].type.name),
                          _typeWidget(pokemonModel.types[1].type.name),
                        ],
                      ),
                    ] else ...[
                      _typeWidget(pokemonModel.types[0].type.name),
                    ],

                    // Pokemon stats
                    Text(pokemonModel.height.toString()),

                    // Pokemon stats
                    Text(pokemonModel.weight.toString()),

                    // Pokemon stats
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Text(pokemonModel.moves[index].move.name);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _typeWidget(String text) {
    return Container(
      decoration: BoxDecoration(
        color: PokemonTypeColor.pokemonType(text),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withAlpha(180),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
