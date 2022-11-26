import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/my_pokemon/widgets/my_pokemon_widgets.dart';

import 'controller/my_pokemon_controller.dart';

class MyPokemonPage extends StatelessWidget {
  const MyPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyPokemonController>(
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream:
                  _.pokemonRef.orderBy('level', descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
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
                          pokemon: _.documentSnapshot,
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
                _.savePokemon();
              },
              child: const Text('save'),
            ),
          ],
        );
      },
    );
  }
}
