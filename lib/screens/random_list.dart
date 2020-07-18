import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutterblocstreamapp/bloc/bloc.dart';
import 'package:flutterblocstreamapp/screens/saved.dart';

class RandomListPage extends StatelessWidget {
  final List<WordPair> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random List Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SavedListPage()));
            },
          ),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
        stream: bloc.savedStream,
        builder: (context, snapshot) {
          return ListView.builder(itemBuilder: (context, index) {
            if (index.isOdd) {
              return Divider();
            }
            var realIndex = index ~/ 2;
            if (realIndex >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(snapshot.data, _suggestions[realIndex]);
          });
        });
  }

  Widget _buildRow(Set<WordPair> saved, WordPair pair) {
    final bool alreadySaved = saved == null
        ? false
        : saved.contains(pair); //처음 snapshot.data null을 false처리 하기 위한 code
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onTap: () {
        bloc.addToOrRemoveFromSavedList(pair);
        },
    );
  }
}
