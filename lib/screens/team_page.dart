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
      //background color for the team page
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(
          widget.team.teamName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 6,

        itemBuilder: (BuildContext context, int index) {
          final Pokemon pokemon = widget.team.pokemon[index];

          //check if pokemon exists in that slot
          final bool hasPokemon = pokemon.name.isNotEmpty;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 110,

              child: ListTile(
                contentPadding: const EdgeInsets.all(10),

                //display pokemons picture or a pokeball icon
                leading: SizedBox(
                  width: 75,
                  height: 75,
                  child: hasPokemon
                      ? Image.network(pokemon.picture, fit: BoxFit.contain) //pull the picture of the pokemon from the pokemon object
                      : const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.catching_pokemon_outlined,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                ),

                //display pokemons name or the pokemon slot index
                title: Text(
                  hasPokemon ? pokemon.name : 'Pokemon Slot ${index + 1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                //add button for navigating to the search page
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  icon: Icon(
                    hasPokemon ? Icons.edit : Icons.add,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
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
