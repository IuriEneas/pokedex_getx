// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokedex_getx/pages/base/view/widgets/search_delegate.dart';
import 'package:pokedex_getx/pages/home/home_page.dart';
import 'package:pokedex_getx/pages/my_pokemon/my_pokemon_page.dart';
import 'package:pokedex_getx/routes/page_routes.dart';
import 'package:pokedex_getx/widgets/customDrawer.dart';

import '../controller/base_controller.dart';

int indexClicked = 0;

class BasePage extends StatelessWidget {
  BasePage({super.key});

  final controller = Get.find<BaseController>();

  final pages = [
    const HomePage(),
    const MyPokemonPage(),
    const Text('Stats'),
    const Text('Inventory'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
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
                    onPressed: () {
                      Get.toNamed(PagesRoute.battleRoute);
                    },
                    icon: const Icon(Icons.delete),
                  );
                },
              ),
            ],
          ),
        ],
        body: GetBuilder<BaseController>(
          builder: (_) {
            if (controller.resultModel?.next != null) {
              //controller.getMorePokemon();
            }
            return Obx(
              () => pages[controller.currentIndex.value],
            );
          },
        ),
      ),
    );
  }
}
