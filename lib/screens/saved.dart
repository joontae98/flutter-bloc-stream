import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutterblocstreamapp/bloc/bloc.dart';

class SavedListPage extends StatelessWidget {

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
    return StreamBuilder<Set<WordPair>>(
        stream: bloc.savedStream,
        builder: (context, snapshot) {
          var saved = Set<WordPair>();

          if (snapshot.hasData)
            saved.addAll(snapshot.data);
          else
            bloc.addCrrentSaved;//sink를 통해 saved를 보내고 stream으로 받으면 snapshot.hasData == true 되고 if문 동작
          return ListView.builder(
              itemCount: saved.length * 2,
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return Divider();
                }
                var realIndex = index ~/ 2;
                return _buildRow(saved.toList()[realIndex]);
              });
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      onTap: () {
        bloc.addToOrRemoveFromSavedList(pair);
      },
    );
  }
}
