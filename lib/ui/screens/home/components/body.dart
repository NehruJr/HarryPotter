import 'package:flutter/material.dart';
import 'package:hp/constants.dart';
import 'package:hp/cubit/characters_cubit.dart';
import 'package:hp/widgets/offline.dart';
import 'characters_carousel.dart';
import 'search_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var cubit = CharactersCubit.get(context);
    return OfflineScreen(
      widget: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchBar( sufIcon: cubit.isSearching?Icons.search : Icons.clear,),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const CharactersCarousel(),
          ],
        ),
      ),
    );
  }
}
