import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_capturable_model.dart';

import '../../services/utils_services.dart';
import '../pokemon_detail/view/widgets/pokemon_widgets.dart';

class MyPokemonDetailPage extends StatelessWidget {
  MyPokemonDetailPage({super.key});

  final PokemonCapModel pokemon = Get.arguments;

  final size = MediaQuery.of(Get.context as BuildContext).size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: PokemonTypeColor.pokemonType(
                pokemon.pokemonModel!.types![0].type!.name!)
            .withAlpha(170),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                // Pokemon Stats and image
                SizedBox(
                  height: size.height - 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Pokemon image
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Circle Detail
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

                            // PokemonImage
                            Hero(
                              tag: pokemon.pokemonModel!.name!,
                              child: Image.network(
                                pokemon.pokemonModel!.sprites!.other!
                                    .officialArtWork!.frontDefault as String,
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
                            typeWidget(
                              UtilsServices.verifyText(
                                  pokemon.pokemonModel!.id!),
                            ),

                            // Pokemon Name
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                pokemon.pokemonModel!.realName,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),

                            // Pokemon types
                            if (pokemon.pokemonModel!.types!.length > 1) ...[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  typeWidget(pokemon
                                      .pokemonModel!.types![0].type!.name!),
                                  typeWidget(pokemon
                                      .pokemonModel!.types![1].type!.name!),
                                ],
                              ),
                            ] else ...[
                              typeWidget(
                                  pokemon.pokemonModel!.types![0].type!.name!),
                            ],

                            // Pokemon height
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '${(pokemon.pokemonModel!.height! / 10).toString()} m',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            // Pokemon Weigh
                            Text(
                              '${(pokemon.pokemonModel!.weight! / 10).toString()} kg',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Pokemon stats
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withAlpha(80),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  statsWidget('Hp', pokemon.hp),
                                  const SizedBox(height: 6),
                                  statsWidget('Attack', pokemon.attack),
                                  const SizedBox(height: 6),
                                  statsWidget('Defense', pokemon.defense),
                                  const SizedBox(height: 6),
                                  statsWidget('Sp. Atk', pokemon.spAttack),
                                  const SizedBox(height: 6),
                                  statsWidget('Sp. Def', pokemon.spDefense),
                                  const SizedBox(height: 6),
                                  statsWidget('Speed', pokemon.speed),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
