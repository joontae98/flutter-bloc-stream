import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutterblocstreamapp/screens/saved.dart';

class RandomListPage extends StatefulWidget {
  @override
  _RandomListPageState createState() => _RandomListPageState();
}

class _RandomListPageState extends State<RandomListPage> {
  final List<WordPair> _suggestions = [];
  final Set<WordPair> _saved = Set();

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
                  MaterialPageRoute(builder: (context) => SavedListPage(saved: _saved,)));
            },
          ),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index.isOdd) {
        return Divider();
      }
      var realIndex = index ~/ 2;
      if (realIndex >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[realIndex]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved =
        _saved.contains(pair); //set 안에 pair 가 있으면 true 없으면 false
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
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
          print(_saved.toString());
        });
      },
    );
  }
}
