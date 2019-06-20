import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget rowBuilder(pair, alreadySaved, updateList) {
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
