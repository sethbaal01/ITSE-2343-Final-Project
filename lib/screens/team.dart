//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import '../objects/pokemon.dart';

class Team extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  List<Pokemon?> _team = List.filled(6, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Teams')),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index){

            },
          ),
        ],
      ),
    );
  }

}