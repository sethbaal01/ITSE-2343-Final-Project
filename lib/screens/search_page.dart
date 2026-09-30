//Seth Baal
//ITSE-2343

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  //list of pokemon to test with
  final List<String> testSearch = [];

  //store results here to return in listview
  List<String> searchResults = [];

  @override
  void initState() {
    super.initState();

    //read file on opening of searchPage
    _loadFile();
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

  //R/W functions
  //----------------------------------------

  //functions for reading text file
  Future<List<String>> _readData() async {
    try {
      String contents = await rootBundle.loadString('lib/pokemon.txt');

      //return file as individual lines
      return contents.split('\n');
    } catch (e) {
      return ['error reading file'];
    }
  }

  //------------------------------------------

  //load file into list
  Future<void> _loadFile() async {
    List<String> fileData = await _readData();

    //set state after reading in data
    setState(() {
      testSearch.addAll(fileData);

      //show all pokemon on opening -- moved here from init because this gets called anyways
      searchResults = List.from(testSearch);
    });
  }

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
              decoration: InputDecoration(
                hintText: 'Search for Pokemon',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    _searchList('');
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: _searchList,
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
