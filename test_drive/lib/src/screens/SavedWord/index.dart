import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SavedWordsScreen extends StatelessWidget {
  Set<WordPair> saved = Set<WordPair>();

  SavedWordsScreen({Key key, @required this.saved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = saved.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 18.0),
          ),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: new Text('Saved Suggestions'),
        elevation: 0.0,
      ),
      body: ListView(children: divided),
    );
  }
}
