import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/view/base_page.dart';
import 'package:pokedex_getx/pages/pokemon/pokemon_page.dart';
import 'package:pokedex_getx/pages/splash/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoute.baseRoute,
      page: () => const BasePage(),
    ),
    GetPage(
      name: PagesRoute.pokemonRoute,
      page: () => const PokemonPage(),
    ),
    GetPage(
      name: PagesRoute.splashRoute,
      page: () => const SplashPage(),
    ),
  ];
}

abstract class PagesRoute {
  static const String baseRoute = '/';
  static const String pokemonRoute = '/pokemon';
  static const String splashRoute = '/splash';
}
