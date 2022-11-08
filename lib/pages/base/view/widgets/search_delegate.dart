import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/routes/page_routes.dart';

import '../../../../model/pokemon_model.dart';
import '../../controller/base_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetBuilder<BaseController>(
      builder: (_) {
        Future.delayed(
          Duration.zero,
          () async {
            final PokemonModel pokemon = await _.getPokemon(query);
            Get.offNamed(PagesRoute.pokemonRoute, arguments: pokemon);
          },
        );

        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'bulbasaur',
      'charmander',
      'squirtle',
    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
