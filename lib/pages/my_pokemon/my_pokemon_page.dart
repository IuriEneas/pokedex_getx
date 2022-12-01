import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';
import 'package:pokedex_getx/pages/my_pokemon/controller/my_pokemon_controller.dart';
import 'package:pokedex_getx/pages/my_pokemon/widgets/my_pokemon_widgets.dart';
import 'package:pokedex_getx/services/helper.dart';

class MyPokemonPage extends StatelessWidget {
  MyPokemonPage({super.key});

  final controller = Get.find<MyPokemonController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: GetBuilder<BattleController>(
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder(
                stream:
                    _.pokemonRef.orderBy('level', descending: true).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    _.querySnapshot = snapshot.data!;
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          _.documentSnapshot = snapshot.data!.docs[index];
                          return MyPokemonTile(
                            pokemon: PokemonHelper.convert(_.documentSnapshot),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.savePokemon();
                },
                child: const Text('save'),
              ),
            ],
          );
        },
      ),
    );
  }
}
