import '../models/character.dart';
import '../models/qoute.dart';
import '../web_serveces/characters_web_services.dart';

class CharacterRepository {
  final CharactersWebServices charactersWebServices;

  CharacterRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacteres() async {
    final characters = await charactersWebServices.getAllCharaceres();
    return characters
        .map((character) => Character.fromjson(character))
        .toList();
  }

  Future<List<Qoute>> getAllCharactereQoute(String charName) async {
    final qoutes = await charactersWebServices.getAllCharactereQoute(charName);
    return qoutes.map((charQoutes) => Qoute.fromJson(charQoutes)).toList();
  }
}
