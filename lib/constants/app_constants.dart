import 'package:flutter/material.dart';

const shared_pokemon_key = 'pokemon_list';
const shared_result_key = 'result_key';

abstract class PokemonTypeColor {
  static Color pokemonType(String type) {
    switch (type) {
      case 'normal':
        return const Color.fromRGBO(116, 116, 118, 1);
      case 'fighting':
        return const Color.fromRGBO(253, 128, 0, 1);
      case 'flying':
        return const Color.fromRGBO(127, 182, 237, 1);
      case 'poison':
        return const Color.fromRGBO(145, 65, 204, 1);
      case 'ground':
        return const Color.fromRGBO(145, 80, 32, 1);
      case 'rock':
        return const Color.fromRGBO(175, 169, 129, 1);
      case 'bug':
        return const Color.fromRGBO(145, 160, 24, 1);
      case 'ghost':
        return const Color.fromRGBO(109, 63, 111, 1);
      case 'steel':
        return const Color.fromRGBO(90, 143, 159, 1);
      case 'fire':
        return const Color.fromRGBO(231, 40, 41, 1);
      case 'water':
        return const Color.fromRGBO(41, 128, 239, 1);
      case 'grass':
        return const Color.fromRGBO(66, 160, 41, 1);
      case 'electric':
        return const Color.fromRGBO(250, 192, 0, 1);
      case 'psychic':
        return const Color.fromRGBO(242, 64, 120, 1);
      case 'ice':
        return const Color.fromRGBO(63, 216, 255, 1);
      case 'dragon':
        return const Color.fromRGBO(79, 97, 224, 1);
      case 'dark':
        return const Color.fromRGBO(79, 65, 63, 1);
      case 'fairy':
        return const Color.fromRGBO(242, 111, 242, 1);
      case 'unknown':
        return const Color.fromARGB(235, 0, 0, 0);
      case 'shadow':
        return const Color.fromRGBO(21, 22, 50, 1);
    }

    return Colors.black.withAlpha(40);
  }
}
