import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/view/widgets/pokemon_card.dart';
import 'package:pokedex_getx/pages/base/view/widgets/search_delegate.dart';
import 'package:pokedex_getx/routes/page_routes.dart';
import '../controller/base_controller.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            centerTitle: true,
            snap: true,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              GetBuilder<BaseController>(
                builder: (_) {
                  return IconButton(
                    onPressed: () async {
                      Get.toNamed(
                        PagesRoute.pokemonRoute,
                        arguments: await _.getRandomPokemon(),
                      );
                    },
                    icon: const Icon(Icons.refresh),
                  );
                },
              ),
              GetBuilder<BaseController>(
                builder: (_) {
                  return IconButton(
                    onPressed: _.deleteShared,
                    icon: const Icon(Icons.delete),
                  );
                },
              ),
            ],
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<BaseController>(
            builder: (_) {
              if (_.resultModel?.next != null) {
                _.getMorePokemon();
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
        ),
      ),
    );
  }
}
