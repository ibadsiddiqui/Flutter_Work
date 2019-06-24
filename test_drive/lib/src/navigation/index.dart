import 'package:flutter/material.dart';
import 'package:startup_namer/src/screens/SavedWord/index.dart';

void pushScreen({context, data}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SavedWordsScreen(
            saved: data,
          ),
    ),
  );
}
