import 'package:bloc/bloc.dart';
import '../../data/models/character.dart';
import '../../data/models/qoute.dart';
import '../../data/repository/characters_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharacterRepository characterRepository;
  List<Character> characters = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacteres().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getQoutes(String charName) {
    characterRepository.getAllCharactereQoute(charName).then((qoutes) {
      emit(QoutesLoaded(qoutes));
    });
  }
}
