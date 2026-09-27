//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import 'team.dart';

class Teams extends StatefulWidget{

  const Teams({super.key});

  @override
  State<StatefulWidget> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  List<Team> _teams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Teams')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _teams.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(_teams[index].name()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}