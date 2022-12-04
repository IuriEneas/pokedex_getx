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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            // Pokemon id
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: typeWidget(
                                  UtilsServices.verifyText(
                                      pokemon.pokemonModel!.id!),
                                  width: 60,
                                ),
                              ),
                            ),

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
                                pokemon.pokemonModel!.sprites!.frontDefault!,
                                height: 270,
                                width: 270,
                                fit: BoxFit.cover,
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
                            // Pokemon Name
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                pokemon.pokemonModel!.realName,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 30,
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

                            const SizedBox(height: 10),

                            // Pokemon stats
                            /*Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withAlpha(80),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
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
                            ),*/

                            Text(
                              '${(pokemon.hp - pokemon.damageTaken)} / ${(pokemon.hp)}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            // Hp Bar
                            _progressBar(
                              percent: pokemon.percentDamage,
                              color: Colors.green[700] as Color,
                              height: 20,
                              reverse: true,
                            ),

                            // Exp Bar
                            _progressBar(
                              height: 15,
                              percent: pokemon.percentExp,
                              color: Colors.blue[700] as Color,
                              edgeInsets:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),

                            // Pokemon Level
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Level: ${(pokemon.level)}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 9 / 5,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  itemCount: pokemon.ownedMoves!.length,
                                  itemBuilder: (context, index) {
                                    return _insideMove(index);
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  _insideMove(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withAlpha(70),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: _circleDecoration(PokemonTypeColor.pokemonType(
                pokemon.ownedMoves![index].type!.name!)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                UtilsServices.formatString(pokemon.ownedMoves![index].name!),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _circleDecoration(Color color) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }

  _progressBar({
    required double height,
    required double percent,
    required Color color,
    bool reverse = false,
    EdgeInsets edgeInsets = const EdgeInsets.all(10),
  }) {
    return Container(
      margin: edgeInsets,
      height: height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(90),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: reverse
                ? (size.width - 20) * (1 - (percent / 100))
                : (size.width - 20) * (percent / 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                Container(
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withAlpha(30),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
