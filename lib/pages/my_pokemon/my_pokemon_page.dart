import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'controller/my_pokemon_controller.dart';

class MyPokemonPage extends StatelessWidget {
  const MyPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyPokemonController>(
      builder: (_) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _.savePokemon();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}
