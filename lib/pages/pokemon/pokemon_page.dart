import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/pokemon/widgets/pokemon_widgets.dart';
import 'package:pokedex_getx/services/utils_services.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonModel pokemonModel = Get.arguments;
  final size = MediaQuery.of(Get.context as BuildContext).size;
  final scrollController = ScrollController();
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
          // Pokemon Stats and image
          Container(
            height: size.height,
            color: Colors.white,
            child: Scaffold(
              backgroundColor: PokemonTypeColor.pokemonType(
                pokemonModel.types[0].type.name,
              ).withAlpha(170),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Pokemon image
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Circle Detail
                          Positioned(
                            top: 0,
                            child: Container(
                              height: 270,
                              width: 270,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(135),
                                color: Colors.white.withAlpha(100),
                              ),
                            ),
                          ),

                          // PokemonImage
                          Hero(
                            tag: pokemonModel.name,
                            child: Image.network(
                              pokemonModel.sprites.other.officialArtWork
                                  .frontDefault as String,
                              height: 300,
                              width: 300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Pokemon Data
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Pokemon id
                          typeWidget(UtilsServices.verifyText(pokemonModel.id)),

                          // Pokemon Name
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              pokemonModel.realName,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),

                          // Pokemon types
                          if (pokemonModel.types.length > 1) ...[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                typeWidget(pokemonModel.types[0].type.name),
                                typeWidget(pokemonModel.types[1].type.name),
                              ],
                            ),
                          ] else ...[
                            typeWidget(pokemonModel.types[0].type.name),
                          ],

                          // Pokemon height
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              '${(pokemonModel.height / 10).toString()} m',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // Pokemon Weigh
                          Text(
                            '${(pokemonModel.weight / 10).toString()} kg',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const Expanded(
                            child: SizedBox(),
                          ),

                          // Pokemon stats
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withAlpha(80),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                statsWidget(
                                    'Hp', pokemonModel.stats[0].baseStat),
                                const SizedBox(height: 6),
                                statsWidget(
                                    'Attack', pokemonModel.stats[1].baseStat),
                                const SizedBox(height: 6),
                                statsWidget(
                                    'Defense', pokemonModel.stats[2].baseStat),
                                const SizedBox(height: 6),
                                statsWidget(
                                    'Sp. Atk', pokemonModel.stats[3].baseStat),
                                const SizedBox(height: 6),
                                statsWidget(
                                    'Sp. Def', pokemonModel.stats[4].baseStat),
                                const SizedBox(height: 6),
                                statsWidget(
                                    'Speed', pokemonModel.stats[5].baseStat),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),

                          // Icon Scroll
                          _animatedIcon()

                          /*Expanded(
                            child: SizedBox(
                              child: (pokemonModel.moves?.length ?? 0) > 1
                                  ? ListView.builder(
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Text(pokemonModel
                                            .moves?[index].move.name as String);
                                      },
                                    )
                                  : Container(),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom sheet
          Container(
            height: 300,
            width: size.width,
            color: PokemonTypeColor.pokemonType(
              pokemonModel.types[0].type.name,
            ).withAlpha(255),
            child: Column(
              children: [Expanded(child: Container())],
            ),
          )
        ],
      ),
    );
  }

  _toggleIcon() {
    setState(() {
      _currIndex = _currIndex == 0 ? _scrollDown() : _scrollUp();
    });
  }

  _scrollDown() {
    scrollController.animateTo(
      300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    return 1;
  }

  _scrollUp() {
    scrollController.animateTo(
      -300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    return 0;
  }

  _animatedIcon() {
    return SizedBox(
      width: 80,
      child: IconButton(
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => RotationTransition(
            turns: child.key == const ValueKey('icon1')
                ? Tween<double>(begin: 0, end: 1).animate(anim)
                : Tween<double>(begin: 0, end: 1).animate(anim),
            child: ScaleTransition(scale: anim, child: child),
          ),
          child: _currIndex == 0
              ? const Icon(
                  Icons.keyboard_arrow_down,
                  key: ValueKey('icon1'),
                  size: 40,
                )
              : const Icon(
                  Icons.keyboard_arrow_up,
                  key: ValueKey('icon2'),
                  size: 40,
                ),
        ),
        onPressed: () {
          _toggleIcon();
        },
      ),
    );
  }
}
