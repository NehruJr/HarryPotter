part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersLoadedState extends CharactersState {
  final List<CharacterModel> characters ;

  CharactersLoadedState(this.characters);
}

class SearchingState extends CharactersState {
  final List<CharacterModel> searchingCharacters ;
  SearchingState(this.searchingCharacters);}

class EmptyState extends CharactersState{
}
