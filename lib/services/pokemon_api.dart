//Seth Baal
//ITSE-2343

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_lister_app/objects/pokemon.dart';

class PokemonApi {
  //make a network request and convert response into a pokemon object
  Future<Pokemon> fetchPokemon(String name) async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'),
    );

    if (response.statusCode == 200) {
      //200 for good response
      return Pokemon.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      //covers other 404 and 429 responses
      throw Exception('Failed to load Pokemon Information');
    }
  }
}
