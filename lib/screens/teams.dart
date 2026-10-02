//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';

import '../objects/pokemon.dart';

import 'team_page.dart';
import '../objects/team.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<StatefulWidget> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final List<Team> _teams = [];

  // Method to add a team to _teams
  void _addTeam() {
    final TextEditingController controller = TextEditingController();

    // Open a dialog box to have user input the team name
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Team'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter a Team Name',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
          actions: [
            //button to pop and cancel
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),

            //button to save and pop
            TextButton(
              onPressed: () {
                final teamName = controller.text.trim();

                // Check if teamName is empty
                if (teamName.isEmpty) {
                  return;
                }

                // Add team with 6 empty Pokemon slots
                setState(() {
                  _teams.add(
                    Team(
                      teamName: teamName,
                      pokemon: List.filled(6, Pokemon(name: '', picture: '')),
                    ),
                  );
                });

                // Close dialog
                Navigator.pop(context);
              },
              child: const Text('Save', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Pokemon Teams',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      //whole page background color
      backgroundColor: Colors.grey[100],

      body: _teams.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.catching_pokemon_outlined,
                    size: 60,
                    color: Colors.red,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Press   +   to Create Your First Team!',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _teams.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final team = _teams[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),

                    //Pokemon Icon
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.catching_pokemon_outlined,
                        color: Colors.red,
                      ),
                    ),

                    //Team Name
                    title: Text(team.teamName),

                    //Trailing arrow
                    trailing: const Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.red,
                    ),

                    //When a team is tapped, go to team_page
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => TeamPage(team: team)),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addTeam,
        child: const Icon(Icons.add),
      ),
    );
  }
}
