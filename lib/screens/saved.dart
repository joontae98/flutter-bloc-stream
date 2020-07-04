import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedListPage extends StatefulWidget {
  SavedListPage({@required this.saved});
  final Set<WordPair> saved;
  @override
  _SavedListPageState createState() => _SavedListPageState();
}

class _SavedListPageState extends State<SavedListPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
