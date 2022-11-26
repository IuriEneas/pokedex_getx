import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_getx/constants/app_constants.dart';

class MyPokemonTile extends StatelessWidget {
  const MyPokemonTile({super.key, required this.pokemon});

  final DocumentSnapshot pokemon;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> pokemonType =
        pokemon['pokemonModel']['types']['0'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: PokemonTypeColor.pokemonType(pokemonType['type']['name'])
                .withAlpha(120),
          ),
          child: Column(
            children: [
              Image.network(
                pokemon['pokemonModel']['sprites']['frontDefault'],
                fit: BoxFit.cover,
              ),
              Text(pokemon['pokemonModel']['name']),
              Text('Lvl: ${pokemon['level']}'),
            ],
          ),
        ),
      ),
    );
  }
}
