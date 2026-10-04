//Seth Baal
//ITSE-2343

import 'pokemon.dart';

//this stores the data of users teams
class Team {
  String teamName;
  List<Pokemon> pokemon;

  Team({required this.teamName, required this.pokemon});

  //factory constructor to read from shared_preferences json
  factory Team.fromSavedJson(Map<String, dynamic> json) {
    return Team(
      teamName: json['teamName'],
      pokemon: (json['pokemon'] as List)
          .map((pokemon) => Pokemon.fromSavedJson(pokemon))
          .toList(),
    );
  }

  //function to turn team back into json
  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'pokemon': pokemon.map((pokemon) => pokemon.toJson()).toList(),
    };
  }
}
