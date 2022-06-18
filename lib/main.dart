import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// アプリが起動するとmainメソッドが呼ばれる
// mainメソッドではrunAppメソッドでWidget（MyAPpクラス）を呼び出している
void main() => runApp(MyApp());

// StatelessWidgetを継承することでMyAppクラス自体がWidgetになる
class MyApp extends StatelessWidget {

  // buildメソッドでウィジェットのUIを作成する
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Startup Name Generator',
      // Scaffoldウィジェット：アプリの基盤となるUIを作成する
      home: RandomWords()
    );
  }
}

// StatefulWidgetを継承するとリロードしなくてもユーザー操作で
// Widgetが動的に変更できたり状態管理ができるようになる
class RandomWords extends StatefulWidget{
  // StatefulWidget自身では状態を持たない。セットとなる、Sateクラスを継承する状態保持クラスで状態管理する
  // StatefulWidgetでは自身の状態を管理するStateクラスのインスタンスを作成する
  @override
  RandomWordsState createState() => new RandomWordsState();
}


class RandomWordsState extends State<RandomWords>{
  // Dartでは変数名やメソッド名の頭にアンダースコアをつけるかどうかでアクセスがprivateかpublicかを判定する
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Startup Name Generator'),),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){ // 無名関数を定義、引数にBuildContextと行番号を渡す
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      ),
    );
  }
}