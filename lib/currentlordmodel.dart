
import 'dart:convert';

CurrentLord currentLordFromJson(String str) => CurrentLord.fromJson(json.decode(str));

 String  currentLordToJson(CurrentLord data) => json.encode(data.toJson());

class CurrentLord {
  String url;
  String name;
  String gender;
  String culture;
  String born;
  String died;
  List<String> titles;
  List<String> aliases;
  String father;
  String mother;
  String spouse;
  List<dynamic> povBooks;
  List<String> tvSeries;
  List<String> playedBy;

  CurrentLord({
    required this.url,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    required this.titles,
    required this.aliases,
    required this.father,
    required this.mother,
    required this.spouse,
    required this.povBooks,
    required this.tvSeries,
    required this.playedBy,
  });

  factory CurrentLord.fromJson(Map<String, dynamic> json) => CurrentLord(
    url: json["url"],
    name: json["name"],
    gender: json["gender"],
    culture: json["culture"],
    born: json["born"],
    died: json["died"],
    titles: List<String>.from(json["titles"].map((x) => x)),
    aliases: List<String>.from(json["aliases"].map((x) => x)),
    father: json["father"],
    mother: json["mother"],
    spouse: json["spouse"],
    povBooks: List<dynamic>.from(json["povBooks"].map((x) => x)),
    tvSeries: List<String>.from(json["tvSeries"].map((x) => x)),
    playedBy: List<String>.from(json["playedBy"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "name": name,
    "gender": gender,
    "culture": culture,
    "born": born,
    "died": died,
    "titles": List<dynamic>.from(titles.map((x) => x)),
    "aliases": List<dynamic>.from(aliases.map((x) => x)),
    "father": father,
    "mother": mother,
    "spouse": spouse,
    "povBooks": List<dynamic>.from(povBooks.map((x) => x)),
    "tvSeries": List<dynamic>.from(tvSeries.map((x) => x)),
    "playedBy": List<dynamic>.from(playedBy.map((x) => x)),
  };
}
