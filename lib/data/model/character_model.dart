
class CharacterModel {
  late String name;
  late String species;
  late String gender;
  late String house;
  late String ancestry;
  late String eyeColour;
  late String hairColour;
  late String patronus;
  late bool hogwartsStudent;
  late bool hogwartsStaff;
  late String actor;
  late bool alive;
  late String image;

  CharacterModel(
      {required this.name,
        required this.species,
        required this.gender,
        required this.house,
        required this.ancestry,
        required this.eyeColour,
        required this.hairColour,
        required this.patronus,
        required this.hogwartsStudent,
        required this.hogwartsStaff,
        required this.actor,
        required this.alive,
        required this.image});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    alive = json['alive'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['species'] = species;
    data['gender'] = gender;
    data['house'] = house;
    data['ancestry'] = ancestry;
    data['eyeColour'] = eyeColour;
    data['hairColour'] = hairColour;
    data['patronus'] = patronus;
    data['hogwartsStudent'] = hogwartsStudent;
    data['hogwartsStaff'] = hogwartsStaff;
    data['actor'] = actor;
    data['alive'] = alive;
    data['image'] = image;
    return data;
  }
}

class Wand {
  late String wood;
  late String core;
  late int length;

  Wand({required this.wood, required this.core, required this.length});

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'];
    core = json['core'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wood'] = wood;
    data['core'] = core;
    data['length'] = length;
    return data;
  }
}