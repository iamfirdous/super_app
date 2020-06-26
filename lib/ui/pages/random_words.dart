import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:super_app/ui/components/custom_app_bar.dart';

const ROUTE_RANDOM_WORDS = '/startup-name-generator';

class RandomWordsPage extends StatefulWidget {
  @override
  RandomWordsPageState createState() => RandomWordsPageState();
}

class RandomWordsPageState extends State<RandomWordsPage> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18);

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (BuildContext _context, int i) {
        if (i.isEven) {
          return Divider(height: 1.0, thickness: 1.4);
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: _buildRow(_suggestions[index]),
        );
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final bool alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: CustomAppBar(titleText: 'Saved suggestions'),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Startup Name Gen',
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
