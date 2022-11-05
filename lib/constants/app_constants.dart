import 'package:flutter/material.dart';

abstract class PokemonTypeColor {
  static Color pokemonType(String type) {
    switch (type) {
      case 'normal':
        return const Color.fromRGBO(202, 152, 166, 1);
      case 'fighting':
        return const Color.fromRGBO(253, 75, 90, 1);
      case 'flying':
        return const Color.fromRGBO(148, 178, 199, 1);
      case 'poison':
        return const Color.fromRGBO(155, 105, 218, 1);
      case 'ground':
        return const Color.fromRGBO(110, 73, 31, 1);
      case 'rock':
        return const Color.fromRGBO(139, 62, 34, 1);
      case 'bug':
        return const Color.fromRGBO(60, 153, 80, 1);
      case 'ghost':
        return const Color.fromRGBO(144, 103, 145, 1);
      case 'steel':
        return const Color.fromRGBO(67, 189, 148, 1);
      case 'fire':
        return const Color.fromRGBO(253, 75, 90, 1);
      case 'water':
        return const Color.fromRGBO(133, 168, 251, 1);
      case 'grass':
        return const Color.fromRGBO(39, 203, 80, 1);
      case 'electric':
        return const Color.fromRGBO(250, 250, 114, 1);
      case 'psychic':
        return const Color.fromRGBO(247, 29, 146, 1);
      case 'ice':
        return const Color.fromRGBO(216, 240, 250, 1);
      case 'dragon':
        return const Color.fromRGBO(98, 202, 217, 1);
      case 'dark':
        return const Color.fromRGBO(89, 89, 120, 1);
      case 'fairy':
        return const Color.fromRGBO(233, 19, 104, 1);
      case 'unknown':
        return const Color.fromARGB(153, 99, 99, 99);
      case 'shadow':
        return const Color.fromARGB(153, 90, 40, 151);
    }

    return Colors.black.withAlpha(40);
  }
}
