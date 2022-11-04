import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/base_page.dart';
import 'package:pokedex_getx/pages/pokemon/pokemon_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoute.baseRoute,
      page: () => const BasePage(),
    ),
    GetPage(
      name: PagesRoute.pokemonRoute,
      page: () => PokemonPage(),
    ),
  ];
}

abstract class PagesRoute {
  static const String baseRoute = '/';
  static const String pokemonRoute = '/pokemon';
}
