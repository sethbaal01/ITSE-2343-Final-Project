//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';

import '../objects/pokemon.dart';
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
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(
          widget.team.teamName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 6,

        itemBuilder: (BuildContext context, int index) {
          final Pokemon pokemon = widget.team.pokemon[index];

          // Check if Pokemon exists in that slot
          final bool hasPokemon = pokemon.name.isNotEmpty;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: SizedBox(
              height: 118,

              child: Row(
                children: [
                  const SizedBox(width: 10),

                  // Display Pokemon's picture or a Poke Ball icon
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: hasPokemon
                        ? Image.network(pokemon.picture, fit: BoxFit.contain)
                        : const Icon(
                            Icons.catching_pokemon_outlined,
                            color: Colors.red,
                            size: 50,
                          ),
                  ),

                  const SizedBox(width: 15),

                  // Display Pokemon's name or the Pokemon slot number
                  Expanded(
                    child: Text(
                      hasPokemon
                          ? '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}'
                          : 'Pokemon Slot ${index + 1}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Add/edit button
                  IconButton(
                    onPressed: () async {
                      // Bring selected Pokemon back
                      final Pokemon? pokemon = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(slotIndex: index),
                        ),
                      );

                      // SetState if a Pokemon is returned
                      if (pokemon != null) {
                        setState(() {
                          widget.team.pokemon[index] = pokemon;
                        });
                      }
                    },
                    icon: Icon(
                      hasPokemon ? Icons.edit : Icons.add,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
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
