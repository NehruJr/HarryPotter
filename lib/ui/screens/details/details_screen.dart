import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hp/constants.dart';
import 'package:hp/data/model/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key, required this.characterModel}) : super(key: key);
final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    characterInfo('Actor Name : ', characterModel.actor),
                    const SizedBox(height: 10,),
                    characterInfo('Name : ', characterModel.name),
                    const SizedBox(height: 10),
                    characterModel.hogwartsStudent ? characterInfo('Hogwarts Student : ', 'Yes'  ):characterInfo ('Hogwarts Student : ', 'Yes'),
                    const SizedBox(height: 10,),
                    characterModel.hogwartsStaff ? characterInfo('Hogwarts Staff : ', 'Yes'): characterInfo ('Hogwarts Staff : ', 'No'),
                    const SizedBox(height: 10,),
                    characterInfo('species : ', characterModel.species),
                    const SizedBox(height: 10,),
                    characterModel.ancestry.isEmpty ? Container() :characterInfo('ancestry : ', characterModel.ancestry ),
                    const SizedBox(height: 10,),
                    characterInfo('House : ', characterModel.house),
                    const SizedBox(height: 10,),
                    displayPatron(),
                  ],
                ),
              ),
              const SizedBox(height: 500,)
            ]
          )),
        ],
      ),
    );
  }
  Widget buildSliverAppBar (){
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(characterModel.name,
          style: const TextStyle(color: Colors.white ),
        ),
        background: Hero(
          tag: characterModel.actor,
          child: Image.network(characterModel.image , fit: BoxFit.cover,),
        ),
      ),
    );
  }


  Widget characterInfo(String title , String value ){

    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style:titleDefaultStyle ,
              ),
              TextSpan(
                text: value,
                style: value == characterModel.house ?TextStyle(color: housesColors(characterModel) , fontSize: 16): valueDefaultStyle,
                  ),
            ]
        ));
  }

  Widget displayPatron(){
    if (characterModel.patronus.isNotEmpty){
      return Row(
        children: [
          Text('patronus' , style: titleDefaultStyle,),
          SizedBox(width: 10,),
          DefaultTextStyle(
            style: const TextStyle(fontSize: 20 , color: Colors.white , shadows: [
              Shadow(blurRadius: 7 , color: kPrimaryColor , offset: Offset(0,0)),
            ]),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText(characterModel.patronus),
              ],
            ),
          ),
        ],
      );
    }
    else {return Container();
    }
  }

}
