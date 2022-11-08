import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

Widget typeWidget(String text) {
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

Widget statsWidget(String statName, int value) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        SizedBox(
          width: 60,
          child: Text('$statName:'),
        ),
        SizedBox(
          width: 28,
          child: Text('$value'),
        ),
        _progressBar(value),
      ],
    ),
  );
}

_progressBar(int value) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _progressBarColor(value)),
    height: 20,
    width: value < 200 ? value * 1.26 : 260,
    child: Container(
      margin: const EdgeInsets.only(
        top: 2,
        left: 2,
        right: 2,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white.withAlpha(60),
      ),
    ),
  );
}

Color _progressBarColor(int value) {
  if (value <= 36) {
    return Colors.red;
  } else if (value <= 72) {
    return Colors.orange;
  } else if (value <= 108) {
    return Colors.amber;
  } else if (value <= 180) {
    return Colors.lightGreen;
  } else if (value <= 216) {
    return Colors.green;
  } else {
    return Colors.purple[800] as Color;
  }
}
