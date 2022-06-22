part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}

class QoutesLoaded extends CharactersState {
  final List<Qoute> qoutes;

  QoutesLoaded(this.qoutes);
}
