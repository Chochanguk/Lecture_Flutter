import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//flutter의 가장 기초적인 위젯: StatelessWidget
class App extends StatelessWidget {
  @override
  //위젯을 build 모든게 위젯으로 구성됨
  Widget build(BuildContext context) {
    //★ 앱의 root return 타입 2가지: 1.MaterialApp(안드로이드) / 2.CupertinoApp(ios)
    //안에는 각 클래스의 생성자에 넣을 파라미터인데, named parameter이다.
    return MaterialApp(
      //Scaffold: 화면의 구성 및 구조에 관한 것
      home: Scaffold(
        //APP상단바: appBar
        appBar: AppBar(
          title: Text('Hello Flutter!'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}
