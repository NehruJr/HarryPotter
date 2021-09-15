
import 'package:hp/data/model/character_model.dart';
import 'package:hp/data/web_service/character_api.dart';

class CharactersRepository {

Future<List<CharacterModel>> getCharacters () async{
  final characters = await CharacterApi().getCharacters();
  return characters.map((character)=>CharacterModel.fromJson(character)).toList();
}
}