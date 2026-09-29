//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';

import '../objects/team.dart';
import 'search_page.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  const TeamPage({super.key, required this.team});

  @override
  State<StatefulWidget> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.team.teamName), centerTitle: true),
      body: ListView.separated(
        itemCount: 6,

        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.catching_pokemon_outlined),
              title: Text('Pokemon Slot ${index + 1}'),
              trailing: IconButton(
                onPressed: () {
                  SearchPage();
                },
                icon: Icon(Icons.add),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
