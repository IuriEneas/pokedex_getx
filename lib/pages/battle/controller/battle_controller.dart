// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../battle_page.dart';

class BattleController extends GetxController {
  PokemonBattle myPokemon = PokemonBattle(
    name: 'Ditto',
    level: 42,
    exp: 124,
    life: 244,
    damageTaken: 0,
    golpes: [
      Golpe(
        value: 101,
        nome: 'Gosmada na cara',
        tipo: 'Normal',
      ),
      Golpe(
        value: -101,
        nome: 'Hero',
        tipo: 'Normal',
      ),
    ],
  );

  PokemonBattle opoPokemon = PokemonBattle(
    name: 'Heracross',
    level: 61,
    exp: 300,
    damageTaken: 0,
    life: 300,
    golpes: [
      Golpe(
        value: 10,
        nome: 'Bater',
        tipo: 'Normal',
      ),
    ],
  );

  heal() {}

  attack(int index) {
    final damageDelt = myPokemon.golpes[index].value;

    if (opoPokemon.damageTaken + damageDelt >= opoPokemon.life) {
      opoPokemon.damageTaken = opoPokemon.life;
    } else {
      if (opoPokemon.damageTaken + damageDelt < 0) {
        opoPokemon.damageTaken = 0;
      } else {
        opoPokemon.damageTaken = dealDamage(opoPokemon.damageTaken, damageDelt);
      }
    }

    update();
  }

  double dealDamage(double damageTaken, double damageDelt) {
    return damageTaken + damageDelt;
  }
}

class PokemonBattle {
  String name;
  int level;
  int exp;
  double life;
  double damageTaken;
  List<Golpe> golpes;

  double get percentDamage {
    double total = damageTaken * 100 / life;
    return total;
  }

  PokemonBattle({
    required this.name,
    required this.level,
    required this.exp,
    required this.life,
    required this.damageTaken,
    required this.golpes,
  });
}
