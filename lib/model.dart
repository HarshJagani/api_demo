// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String name;
  String region;
  String coatOfArms;
  String words;
  String currentLord;
  String overlord;
  Founded founded;
  String founder;
  List<String> ancestralWeapons;
  List<String> cadetBranches;
  List<String> swornMembers;

  Welcome({
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.words,
    required this.currentLord,
    required this.overlord,
    required this.founded,
    required this.founder,
    required this.ancestralWeapons,
    required this.cadetBranches,
    required this.swornMembers,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    region: json["region"],
    coatOfArms: json["coatOfArms"],
    words: json["words"],
    currentLord: json["currentLord"],
    overlord: json["overlord"],
    founded: foundedValues.map[json["founded"]]!,
    founder: json["founder"],
    ancestralWeapons: List<String>.from(json["ancestralWeapons"].map((x) => x)),
    cadetBranches: List<String>.from(json["cadetBranches"].map((x) => x)),
    swornMembers: List<String>.from(json["swornMembers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "coatOfArms": coatOfArms,
    "words": words,
    "currentLord": currentLord,
    "overlord": overlord,
    "founded": foundedValues.reverse[founded],
    "founder": founder,
    "ancestralWeapons": List<dynamic>.from(ancestralWeapons.map((x) => x)),
    "cadetBranches": List<dynamic>.from(cadetBranches.map((x) => x)),
    "swornMembers": List<dynamic>.from(swornMembers.map((x) => x)),
  };
}

enum Founded {
  COMING_OF_THE_ANDALS,
  EMPTY,
  THE_299_AC
}

final foundedValues = EnumValues({
  "Coming of the Andals": Founded.COMING_OF_THE_ANDALS,
  "": Founded.EMPTY,
  "299 AC": Founded.THE_299_AC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
