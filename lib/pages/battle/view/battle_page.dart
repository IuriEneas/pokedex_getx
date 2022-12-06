import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';
import 'package:pokedex_getx/pages/battle/view/widgets/battle_page_widgets.dart';

import '../../../model/pokeball_model.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({super.key});

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  final controller = Get.find<BattleController>();

  final pokeballList = [
    PokeballModel(
      name: 'pokeball',
      captureRate: 70,
    ),
    PokeballModel(
      name: 'greatball',
      captureRate: 90,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.updatePokemon();
  }

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
              child: _.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Column(
                          children: [
                            DataWidget(pokemon: _.opoPokemon!),
                            _pokemonWidget(),
                            _pokemonWidget(isOpponent: false),
                            DataWidget(pokemon: _.pokemon, isOpponent: false),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            color: const Color.fromARGB(223, 192, 169, 95),
                            child: _.isGridviewVisible
                                ? GridView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 121 / 46,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                    ),
                                    children: [
                                      _gridViewButtons(
                                        text: 'Fight',
                                        onPressed: () {
                                          _.gridViewVisibility();
                                        },
                                      ),
                                      _gridViewButtons(
                                        text: 'Bag',
                                        onPressed: () {
                                          _.choosePokeball();
                                        },
                                      ),
                                      _gridViewButtons(
                                        text: 'Pokémon',
                                        onPressed: () async {
                                          _.choosePokemon();
                                        },
                                      ),
                                      _gridViewButtons(
                                        text: 'Run',
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  )
                                : _fightButton(),
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
                  ? controller.opoPokemon!.pokemonModel!.sprites!.frontDefault
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

  _gridViewButtons({required void Function() onPressed, String text = ''}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black.withAlpha(90),
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: onPressed,
      child: Text(text),
    );
  }

  _fightButton() {
    return GetBuilder<BattleController>(
      builder: (_) {
        return Row(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 50 / 24,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _.pokemon.ownedMoves!.length,
                itemBuilder: (context, index) {
                  return _gridViewButtons(
                    text: _.pokemon.ownedMoves![index].name!,
                    onPressed: () {
                      _.attack(_.pokemon, _.opoPokemon!, index);
                    },
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                SizedBox(
                  height: 60,
                  child: _gridViewButtons(
                    text: 'Back',
                    onPressed: () {
                      _.gridViewVisibility();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
