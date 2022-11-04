String baseUrl = 'https://pokeapi.co/api/v2';

abstract class Endpoints {
  static String resultPokemon = '$baseUrl/pokemon';

  static String pokemonEndpoint(String name) {
    String getPokemon = '$baseUrl/pokemon/$name';
    return getPokemon;
  }
}
