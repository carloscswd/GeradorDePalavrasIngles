import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp (
      title: 'Gerador de palavras',
      home:  RandomWords()
    );
  }

}

class RandomWordState extends State<RandomWords> {

  final suggestions = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de palavras'),
      ),
      body: buildSuggestions(),
    );
  }
  Widget buildSuggestions() {

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if(i.isOdd) return Divider();
        final index = i ~/ 2;
        if(index >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(suggestions[index]);
    }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget{

  @override
  RandomWordState createState() => new RandomWordState();
}