import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

Widget ListOfWords(_suggestions, _saved, updateList) {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return rowBuilder(_suggestions[index], _saved, updateList);
      });
}

Widget rowBuilder(WordPair pair, _saved, updateList) {
  final bool alreadySaved = _saved.contains(pair);
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () => updateList(alreadySaved, pair));
}
