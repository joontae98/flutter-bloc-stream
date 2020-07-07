import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedListPage extends StatefulWidget {
  final Set<WordPair> saved;
  SavedListPage({@required this.saved});
  @override
  _SavedListPageState createState() => _SavedListPageState();
}

class _SavedListPageState extends State<SavedListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),
      body: _buildList(),
    );
  }
  Widget _buildList() {
    return ListView.builder(itemCount: widget.saved.length,itemBuilder: (context, index) {
      if (index.isOdd) {
        return Divider();
      }
      var realIndex = index ~/ 2;
      return _buildRow(widget.saved.toList()[realIndex]);
    });
  }
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved =
    widget.saved.contains(pair); //set 안에 pair 가 있으면 true 없으면 false
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
    );
  }

}
