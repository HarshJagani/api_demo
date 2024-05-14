// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Overlord overlordFromJson(String str) => Overlord.fromJson(json.decode(str));

String overlordToJson(Overlord data) => json.encode(data.toJson());

class Overlord {

  String name;
  String region;
  String coatOfArms;
  String words;
  List<String> titles;
  List<String> seats;

  Overlord({
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.words,
    required this.titles,
    required this.seats,
  });

  factory Overlord.fromJson(Map<String, dynamic> json) => Overlord(
    name: json["name"],
    region: json["region"],
    coatOfArms: json["coatOfArms"],
    words: json["words"],
    titles: List<String>.from(json["titles"].map((x) => x)),
    seats: List<String>.from(json["seats"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {

    "name": name,
    "region": region,
    "coatOfArms": coatOfArms,
    "words": words,
    "titles": List<dynamic>.from(titles.map((x) => x)),
    "seats": List<dynamic>.from(seats.map((x) => x)),
  };
}
