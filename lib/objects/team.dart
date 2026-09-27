//Seth Baal
//ITSE-2343

import 'pokemon.dart';

//this stores the data of users teams
class Team {
  String teamName;
  List<Pokemon?> pokemon;

  Team({
    required this.teamName,
    required this.pokemon,
  });
}