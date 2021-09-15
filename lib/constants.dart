import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFf4b301);

TextStyle titleDefaultStyle = const TextStyle(
    color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle valueDefaultStyle =
    const TextStyle(color: Colors.white, fontSize: 16);

Color housesColors(characterModel) {
  if (characterModel.house == 'Gryffindor') {
    return const Color(0xffae0001);
  } else if (characterModel.house == 'Slytherin') {
    return const Color(0xff2a623d);
  } else if (characterModel.house == 'Hufflepuff') {
    return const Color(0xffecb939);
  } else if (characterModel.house == 'Ravenclaw') {
    return const Color(0xff222f5b);
  } else {
    return Colors.white;
  }
}

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);
