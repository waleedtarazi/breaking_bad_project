// ignore_for_file: public_member_api_docs, sort_constructors_first, body_might_complete_normally_nullable
import 'package:breaking_bad/businessLogic/cubit/characters_cubit.dart';
import 'package:breaking_bad/constants.dart';
import 'package:breaking_bad/data/models/character.dart';
import 'package:breaking_bad/data/repository/characters_repository.dart';
import 'package:breaking_bad/data/web_serveces/characters_web_services.dart';
import 'package:breaking_bad/presntion/screens/characteres_screen.dart';
import 'package:breaking_bad/presntion/screens/characters_detiles_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: ((BuildContext context) => charactersCubit),
                  child: const CharactersScreen(),
                ));

      case charactersDetilesScreen:
        final character = routeSettings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(characterRepository),
                  child: CharacteresDetilesScreen(
                    character: character,
                  ),
                ));
    }
  }
}
