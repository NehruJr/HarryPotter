import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp/constants.dart';
import 'package:hp/cubit/characters_cubit.dart';
import 'package:hp/data/model/character_model.dart';
import 'package:hp/ui/screens/home/components/character_card.dart';
import 'dart:math' as math;

class CharactersCarousel extends StatefulWidget {
  const CharactersCarousel({Key? key}) : super(key: key);

  @override
  _CharactersCarouselState createState() => _CharactersCarouselState();
}

late PageController _pageController;
int initialPage = 1;

class _CharactersCarouselState extends State<CharactersCarousel> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  List<CharacterModel> getCharacters = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoadedState) {
          getCharacters = state.characters;
          return buildPadding(getCharacters);
        } else if (state is SearchingState) {
          getCharacters = state.searchingCharacters;
          return buildPadding(getCharacters);
        } else {
          return Center(child: Image.asset('assets/images/ApiLoading.gif'));
        }
      },
    );
  }

  Padding buildPadding(getCharacters) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: .85,
        child: PageView.builder(
          onPageChanged: (value) {
            initialPage = value;
          },
          controller: _pageController,
          physics: const ClampingScrollPhysics(),
          itemCount: getCharacters.length,
          itemBuilder: (context, index) =>
              buildMovieSlider(index, getCharacters),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index, getCharacters) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!.toDouble();
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          opacity: initialPage == index ? 1 : 0.4,
          duration: const Duration(milliseconds: 350),
          child: Transform.rotate(
            angle: math.pi * value,
            child: CharacterCard(
              characterModel: getCharacters[index],
            ),
          ),
        );
      },
    );
  }
}
