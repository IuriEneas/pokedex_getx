String baseUrl = 'https://pokeapi.co/api/v2';

abstract class Endpoints {
  static String resultPokemon = '$baseUrl/pokemon';

  static String pokemonEndpoint(String name) {
    String getPokemon = '$baseUrl/pokemon/$name';
    return getPokemon;
  }

  static String getRandomPokemon = '$baseUrl/pokemon?limit=100000&offset=0';

  static String getAllPokemon = '$baseUrl/move?limit=100000&offset=0';

  static String moveEndpoint(String name) {
    String getMove = '$baseUrl/move/$name';
    return getMove;
  }

  static String pokemonSpeciesEndpoint(String name) {
    String getSpecies = '$baseUrl/pokemon-species/$name';
    return getSpecies;
  }

  static String pokemonGrowthRateEndpoint(String name) {
    String getGrowth = '$baseUrl/growth-rate/$name';
    return getGrowth;
  }
}
