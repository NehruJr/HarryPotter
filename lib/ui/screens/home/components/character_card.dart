import 'package:flutter/material.dart';
import 'package:hp/constants.dart';
import 'package:hp/data/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.characterModel})
      : super(key: key);
  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'detailsScreen',
          arguments: characterModel),
      child: Hero(
        tag: characterModel.actor,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: characterModel.image.isNotEmpty
                        ? FadeInImage.assetNetwork(
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: 'assets/images/hploading.gif',
                            image: characterModel.image,
                            fit: BoxFit.cover,
                          )
                        : Image.asset('assets/images/hploading.gif'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Text(characterModel.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: housesColors(characterModel))),
            ),
          ],
        ),
      ),
    );
  }
}
