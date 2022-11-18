import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../base/controller/base_controller.dart';
import '../base/view/widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<BaseController>(
        builder: (_) {
          if (_.resultModel?.next != null) {
            //_.getMorePokemon();
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
