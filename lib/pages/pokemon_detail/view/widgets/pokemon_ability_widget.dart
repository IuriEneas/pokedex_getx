import 'package:flutter/material.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/move_model.dart';

class AbilityWidget extends StatelessWidget {
  const AbilityWidget({super.key, required this.move});
  final MoveModel move;

  @override
  Widget build(BuildContext context) {
    final abilityFormatted = move.name?.replaceAll('-', ' ');

    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 60,
        decoration: BoxDecoration(
          color: PokemonTypeColor.pokemonType(move.type!.name),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(abilityFormatted.toString())),
      ),
    );
  }
}
