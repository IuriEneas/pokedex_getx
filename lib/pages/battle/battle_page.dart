import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';
import 'package:pokedex_getx/pages/battle/widgets/battle_page_widgets.dart';

class BattlePage extends StatelessWidget {
  BattlePage({super.key});

  final controller = Get.find<BattleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BattleController>(
        builder: (_) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Color.fromRGBO(229, 230, 232, 1),
                  Color.fromRGBO(191, 171, 220, 1),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      DataWidget(
                        pokemon: _.opoPokemon,
                        isOpponent: true,
                      ),
                      _pokemonWidget(),
                      _pokemonWidget(isOpponent: false),
                      DataWidget(
                        pokemon: _.pokemon,
                        isOpponent: false,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color.fromARGB(223, 192, 169, 95),
                      child: Visibility(
                        visible: true,
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 121 / 46,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Fight'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Bag'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Pokémon'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Run'),
                            ),
                          ],
                        ),
                      ),

                      /**/
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _pokemonWidget({bool isOpponent = true}) {
    return Stack(
      children: [
        isOpponent
            ? Positioned(
                bottom: 30,
                right: 12,
                child: _circleDecoration(),
              )
            : Positioned(
                bottom: 30,
                left: 12,
                child: _circleDecoration(),
              ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
              isOpponent ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Image.network(
              isOpponent
                  ? controller.opoPokemon.pokemonModel!.sprites!.frontDefault
                      as String
                  : controller.pokemon.pokemonModel!.sprites!.backDefault ??
                      controller.pokemon.pokemonModel!.sprites!.frontDefault
                          as String,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ],
        ),
      ],
    );
  }

  _circleDecoration() {
    return Container(
      height: 60,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: const BorderRadius.horizontal(
          left: Radius.elliptical(300, 100),
          right: Radius.elliptical(300, 100),
        ),
        gradient: const RadialGradient(
          radius: 1,
          colors: [
            Colors.white,
            Color.fromARGB(226, 226, 226, 226),
            Color.fromARGB(198, 198, 198, 198),
          ],
        ),
      ),
    );
  }

  _fightButton() {
    return GetBuilder<BattleController>(
      builder: (_) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: _.pokemon.ownedMoves!.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                _.attack(_.pokemon, _.opoPokemon, index);
              },
              child: Text(_.pokemon.ownedMoves![index].name as String),
            );
          },
        );
      },
    );
  }
}
