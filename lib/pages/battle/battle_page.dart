import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_capturable_model.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';

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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: _dataWidget(
                              pokemon: _.opoPokemon!,
                              isOpponent: true,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 30,
                            right: 4,
                            child: _circleDecoration(),
                          ),
                          _pokemonWidget(),
                        ],
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 50,
                            left: 12,
                            child: _circleDecoration(),
                          ),
                          _pokemonWidget(isOpponent: false),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: _dataWidget(
                              pokemon: _.pokemon!,
                              isOpponent: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color.fromARGB(223, 192, 169, 95),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: _.pokemon!.ownedMoves.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: () {
                              _.attack(index);
                            },
                            child: Text(
                                _.pokemon!.ownedMoves[index].name as String),
                          );
                        },
                      ),
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          isOpponent ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Image.network(
          isOpponent
              ? controller.opoPokemon?.pokemonModel.sprites.frontDefault
                  as String
              : controller.pokemon?.pokemonModel.sprites.frontDefault as String,
          fit: BoxFit.cover,
          height: 200,
          width: 200,
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

  _dataWidget({
    bool isOpponent = true,
    required PokemonCapModel pokemon,
  }) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3),
          top: BorderSide(width: 3),
          left: BorderSide(width: 3),
          right: BorderSide(width: 3),
        ),
        color: Color.fromRGBO(243, 247, 212, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          // Pokemon name and level
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  pokemon.pokemonModel.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Lv${pokemon.level}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),

          // Health points bar
          Container(
            height: 20,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 2),
                top: BorderSide(width: 2),
                left: BorderSide(width: 2),
                right: BorderSide(width: 2),
              ),
            ),
            child: Row(
              children: [
                _lifeBarWidget(pokemon.percentDamage),
              ],
            ),
          ),

          // Health points number
          Visibility(
            visible: !isOpponent,
            child: Container(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${pokemon.hp - pokemon.damageTaken} / ',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${pokemon.hp}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),

          // Xp bar
          isOpponent
              ? const SizedBox(
                  height: 20,
                )
              : Visibility(
                  visible: !isOpponent,
                  child: _expBar(
                    pokemon.percentExp,
                  ),
                ),
        ],
      ),
    );
  }

  _expBar(double percentExp) {
    final width = 224 * (percentExp / 100);

    return Container(
      alignment: Alignment.bottomCenter,
      height: 8,
      width: 226,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1),
          top: BorderSide(width: 1),
          left: BorderSide(width: 1),
          right: BorderSide(width: 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  _lifeBarWidget(double percentDamage) {
    final width = 224 - (224 * (percentDamage / 100));

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: _healthBarColor(width),
      ),
    );
  }

  Color _healthBarColor(double width) {
    if (width < 68) {
      return Colors.red;
    } else if (width < 136) {
      return Colors.amber;
    } else {
      return Colors.green;
    }
  }
}

class Golpe {
  double value;
  String nome;
  String tipo;
  Golpe({
    required this.value,
    required this.nome,
    required this.tipo,
  });
}
