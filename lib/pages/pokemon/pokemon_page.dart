import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({super.key});

  final PokemonModel pokemonModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: PokemonTypeColor.pokemonType(
          pokemonModel.types[0].type.name,
        ).withAlpha(170),
        body: SafeArea(
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
                    Hero(
                      tag: pokemonModel.name,
                      child: Image.network(
                        pokemonModel.sprites.other.officialArtWork.frontDefault
                            as String,
                        height: 300,
                        width: 300,
                      ),
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
                    _typeWidget(_verifyText(pokemonModel.id)),

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
                        child: (pokemonModel.moves?.length ?? 0) > 1
                            ? ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Text(pokemonModel
                                      .moves?[index].move.name as String);
                                },
                              )
                            : Container(),
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

  String _verifyText(int id) {
    final numberText = id.toString();

    if (numberText.length == 1) {
      return '#${numberText.padLeft(3, '0')}';
    } else if (numberText.length == 2) {
      return '#${numberText.padLeft(3, '0')}';
    } else {
      return '#$numberText';
    }
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
