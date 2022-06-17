import 'dart:io';

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
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      // Scaffoldウィジェット：アプリの基盤となるUIを作成する
      home: Scaffold(
        // appBarプロパティ：画面上部のトップバーのUIを宣言
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          backgroundColor: Colors.pink,
        ),
        // bodyプロパティ：メインコンテンツとなるウィジェットを宣言（ここではCenterウィジェット）
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
