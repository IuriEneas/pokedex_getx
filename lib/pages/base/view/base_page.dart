import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pokedex_getx/pages/base/view/widgets/pokemon_card.dart';
import '../controller/base_controller.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<BaseController>(
                    builder: (_) {
                      if (_.pokemonList.length < _.resultModel!.count &&
                          _.resultModel?.next != null) {
                        _.getMorePokemon();
                      }

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: _.pokemonList.length,
                        itemBuilder: (context, index) {
                          return PokemonCard(
                            pokemon: _.pokemonList[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
