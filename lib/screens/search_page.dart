//Seth Baal
//ITSE-2343

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  //list of pokemon to test with
  final List<String> testSearch = [
    'Pikachu',
    'Charmander',
    'Bulbasaur',
    'Squirtle',
    'Pidgey',
    'Ratatta',
  ];

  //store results here to return in listview
  List<String> searchResults = [];

  @override
  Future<void> initState() {
    searchResults = List.from(testSearch);
    super.initState();
  }

  //implement search function
  void _searchList(String text) {
    setState(() {
      List<String> matches = testSearch.where((item) {
        return item.toLowerCase().contains(text.toLowerCase());
      }).toList();

      searchResults = matches;
    });
  }

  //functions for reading text file
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pokemon.txt');
  }

  Future<List<String>> _readData() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsLines();
      return contents;
    } catch (e) {
      return ['error reading file'];
    }
  }

  //load file into list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search For Pokemon'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search for Pokemon',
                border: OutlineInputBorder(),
              ),
              onChanged: _searchList, //replace here
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(searchResults[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
