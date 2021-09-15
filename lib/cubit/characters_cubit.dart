import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp/data/model/character_model.dart';
import 'package:hp/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  final CharactersRepository charactersRepository ;
  static CharactersCubit get(context) => BlocProvider.of(context);

     List<CharacterModel> allCharacters = [];
    void getAllCharacters (){
    CharactersRepository().getCharacters().then((character) {
      allCharacters = character;
      emit(CharactersLoadedState(character));
    }
    );

  }

  final searchController = TextEditingController();
  List<CharacterModel> searchingCharacters = [];

  bool isSearching = false ;

  void addSearchedItemsToList(String searchedCharacter){
      searchingCharacters = allCharacters.where((character) =>
          character.name.toLowerCase().startsWith(searchedCharacter)).toList();
      if(searchingCharacters.isNotEmpty) {
        isSearching = true;
        emit(SearchingState(searchingCharacters));
      }else{
       'No Characters';
        emit(EmptyState());
      }
    }

  void stopSearching(){
    isSearching = false;
    searchController.clear();
    emit(CharactersLoadedState(allCharacters));
  }
}
