import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

//StatelessWidget: 단순히 UI를 보여주는 것
//StatefulWidget: 실시간으로 데이터의 변화를 봄.(인터랙티브하게 앱을 만듦)
void main() {
  runApp(const App());
}

// StatefulWidget: 상태를 만들고 해당 상태를 전달함.
class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

//State는 우리가 UI를 구축하고,데이터를 저장하는곳
class _AppState extends State<App> {
  bool showTitle = true;
  //버튼 클릭시 텍스트를 지웠다가 나타나게 하는 메소드 생성(dispose 메소드를 설명하기 위함.)
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //테마의 데이터중 텍스트에서 큰 제목 타이틀의 색상을 레드로 지정.
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //내가 지정한 위젯을 사용
              showTitle ? const MyLargeTitle() : const Text('Nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Extract Widget: 하나의 메소드로 분류해서 처리하게 함.
//이는 StatelssWidget으로 처리하는 경우는 UI만 다룸.
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  //값을 initia시켜주는 메소드(build전에 실행함.)
  //보통 API나 부모요소에 의존하는 데이터를 초기화해야 하는 경우,API에서 업데이트를 구독할때 사용
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //dispose메소드는 위젯이 스크린에서 제거될 때 호출되는 메서드이다.
  //위에선  MyLargeTitle()의 텍스트가 사라지면 실행됨.
  @override
  void dispose() {
    super.dispose();
    print("dispose!");
  }

//BuildContext context: 이전에 있는 모든 상위 요소들에 대한 정보이다.
  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        //★★★context를 통해 상위 요소의 값을 불러올 수 있다.★★★
        //해석: color는 상위요소의 Theme인데, textTheme의 titleLage의 color이다.
        //이때 titleLarge의 색은 Null이면 안되므로 ?를 붙여준다.
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
