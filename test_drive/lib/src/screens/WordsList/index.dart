import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/src/component/listWithIcon/index.dart';
import 'package:startup_namer/src/navigation/index.dart';
import 'package:startup_namer/src/screens/SavedWord/index.dart';

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  void updateSavedWords(alreadySaved, pair) {
    setState(() {
      if (alreadySaved) {
        _saved.remove(pair);
      } else {
        _saved.add(pair);
      }
    });
  }

  Widget _buildSuggestions() {
    return ListOfWords(_suggestions, _saved, this.updateSavedWords);
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return rowBuilder(pair, alreadySaved, this.updateSavedWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    pushScreen(context: context, data: _saved);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
