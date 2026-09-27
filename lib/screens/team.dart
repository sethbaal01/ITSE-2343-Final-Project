//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import '../objects/pokemon.dart';

class Team extends StatefulWidget{
  final String teamName;

  const Team ({super.key, required this.teamName});

  String name() {
    return teamName;
  }

  @override
  State<StatefulWidget> createState() => _TeamState();
}

class _TeamState extends State<Team> {

  final List<Pokemon?> _team = List.filled(6, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Teams')),
      body: Column(
        children: [
          ListView.separated(
            itemCount: 6,

            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.catching_pokemon),
                  title: Text('Pokemon Slot ${index + 1}'),
                  trailing: const Icon(Icons.add),
                ),
              );
            },

            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          )
        ],
      ),
    );
  }

}