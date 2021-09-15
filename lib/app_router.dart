import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp/data/repository/characters_repository.dart';
import 'package:hp/ui/screens/details/details_screen.dart';
import 'package:hp/ui/screens/home/home_screen.dart';
import 'cubit/characters_cubit.dart';
import 'data/model/character_model.dart';

late CharactersCubit charactersCubit;
late CharactersRepository charactersRepository;


class AppRouter {

  AppRouter() {
    charactersRepository = CharactersRepository();
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => charactersCubit,
              child: const HomeScreen(),
            ),);
      case 'detailsScreen':
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => CharactersCubit(charactersRepository),
              child:  CharacterDetailsScreen(characterModel: character),
            ),);
    }
  }

}