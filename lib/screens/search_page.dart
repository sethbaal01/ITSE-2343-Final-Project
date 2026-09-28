//Seth Baal
//ITSE-2343

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_lister_app/objects/pokemon.dart';
import 'team_page.dart';
import '../objects/team.dart';

class SearchPage extends StatefulWidget {
  //list of pokemon to test with
  final List<String> testSearch = [
    'Pikachu',
    'Charmander',
    'Bulbasaur',
    'Squirtle',
    'Pidgey',
    'Ratatta',
  ];

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  //implement search function

  @override
  Widget build(BuildContext context) {

  }
}