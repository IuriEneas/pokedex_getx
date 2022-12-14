import 'package:get/get.dart';
import 'package:pokedex_getx/pages/auth/login_page.dart';
import 'package:pokedex_getx/pages/base/binding/base_binding.dart';
import 'package:pokedex_getx/pages/base/view/base_page.dart';
import 'package:pokedex_getx/pages/battle/view/battle_page.dart';
import 'package:pokedex_getx/pages/battle/view/widgets/select_item_page.dart';
import 'package:pokedex_getx/pages/battle/view/widgets/select_pokemon_page.dart';
import 'package:pokedex_getx/pages/my_pokemon_detail/my_pokemon_detail_page.dart';
import 'package:pokedex_getx/pages/pokemon_detail/view/pokemon_page.dart';
import 'package:pokedex_getx/pages/query/query_page.dart';
import 'package:pokedex_getx/pages/splash/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoute.baseRoute,
      page: () => BasePage(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: PagesRoute.pokemonRoute,
      page: () => const PokemonPage(),
    ),
    GetPage(
      name: PagesRoute.queryRoute,
      page: () => QueryPage(),
    ),
    GetPage(
      name: PagesRoute.splashRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: PagesRoute.battleRoute,
      page: () => const BattlePage(),
    ),
    GetPage(
      name: PagesRoute.myPokemonRoute,
      page: () => MyPokemonDetailPage(),
    ),
    GetPage(
      name: PagesRoute.selectPokemonRoute,
      page: () => SelectPokemonPage(),
    ),
    GetPage(
      name: PagesRoute.selectItemRoute,
      page: () => SelectItemPage(),
    ),
    GetPage(
      name: PagesRoute.loginRoute,
      page: () => LoginPage(),
    ),
  ];
}

abstract class PagesRoute {
  static const String baseRoute = '/';
  static const String pokemonRoute = '/pokemon';
  static const String splashRoute = '/splash';
  static const String queryRoute = '/query';
  static const String battleRoute = '/battle';
  static const String myPokemonRoute = '/my_pokemon';
  static const String selectPokemonRoute = '/select_pokemon';
  static const String selectItemRoute = '/select_item';
  static const String loginRoute = '/login';
}
