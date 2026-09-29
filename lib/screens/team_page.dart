//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import '../objects/pokemon.dart';
import '../objects/team.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  const TeamPage({
    super.key,
    required this.team,
  });

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.teamName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 6,

              itemBuilder: (BuildContext context, int index) {
                final pokemon = widget.team.pokemon[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.catching_pokemon),
                    title: Text(
                      pokemon == null ? 'Pokemon Slot ${index + 1}'
                          : pokemon.name,
                    ),
                    trailing: const Icon(Icons.add),
                  ),
                );
              },

              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}