//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import 'team.dart';

class Teams extends StatefulWidget{

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
          ListView.builder(
            itemCount: _teams.length,
            itemBuilder: (BuildContext context, int index){

            },
          ),
        ],
      ),
    );
  }

}