//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
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
            ),
          ),
          actions: [

            //button to pop and cancel
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
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
                      pokemon: List.filled(6, null),
                    ),
                  );
                });

                // Close dialog
                Navigator.pop(context);
              },
              child: const Text('Save'),
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
        title: const Text('My Teams'),
      ),

      body: ListView.builder(
        itemCount: _teams.length,
        itemBuilder: (context, index) {
          final team = _teams[index];

          return ListTile(
            title: Text(team.teamName),

            //when user selects the list, take them to that teamPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamPage(team : team),
                ),
              );
            },
          );
        },
      ),

      //call _addTeam to create a new team
      floatingActionButton: FloatingActionButton(
        onPressed: _addTeam,
        child: const Icon(Icons.add),
      ),
    );
  }
}