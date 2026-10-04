//Seth Baal
//ITSE-2343

import 'dart:convert';

import '../objects/team.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveManagement {
  //function to save teams configuration
  static Future<void> saveTeams(List<Team> teams) async {
    final prefs = await SharedPreferences.getInstance();

    //turn our objects into json
    final String teamsJson = jsonEncode(
      teams.map((team) => team.toJson()).toList(),
    );

    //test printing to find errors
    // print(teamsJson);

    await prefs.setString('teams', teamsJson);
  }

  //function to load in teams from save
  static Future<List<Team>> loadTeams() async {
    final prefs = await SharedPreferences.getInstance();

    //var to see if there are any teams objects stored in the json
    final String? teamsJson = prefs.getString('teams');

    //check if there are no teams
    if (teamsJson == null) {
      return [];
    }

    //variable to store the teams we found
    final List<dynamic> decodedTeams = jsonDecode(teamsJson);

    return decodedTeams.map((team) => Team.fromSavedJson(team)).toList();
  }
}
