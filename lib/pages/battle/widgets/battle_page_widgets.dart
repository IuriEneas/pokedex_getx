import 'package:flutter/material.dart';
import 'package:pokedex_getx/model/pokemon_capturable_model.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key, required this.pokemon, this.isOpponent = true});

  final bool isOpponent;
  final PokemonCapModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isOpponent ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
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
                        pokemon.pokemonModel!.name!,
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
          ),
        ),
      ],
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
