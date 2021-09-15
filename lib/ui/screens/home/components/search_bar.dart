import 'package:flutter/material.dart';
import 'package:hp/constants.dart';
import 'package:hp/cubit/characters_cubit.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key, this.sufIcon}) : super(key: key);
  IconData? sufIcon;
  @override
  Widget build(BuildContext context) {
    var cubit = CharactersCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff292a36),
                Color(0xff292a36),
              ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          maxLines: 1,
          controller: cubit.searchController,
          onChanged: (String searchedCharacter) {
            cubit.addSearchedItemsToList(searchedCharacter);
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Find a Character ... ',
            hintStyle: const TextStyle(color: Colors.white12),
            border: InputBorder.none,
            suffixIcon: IconButton(
                onPressed: () {
                  cubit.stopSearching();
                },
                icon: Icon(
                  sufIcon,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
