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
  /*
  int counter = 0; //저장할 데이터(클래스의 특성)
  void onClicked() {
    //★★★★setState함수는 State 클래스에 데이터의 변경을 알리는 함수이다.★★★
    //이것은 새로운 데이터 와 함께 build를 한번더 하는 방법으로 실행된다.
    setState(() {
      counter += 1;
    });
    /*혹은 밑과 같이 사용가능. 추가적으로 이 주석을 지우면 두개씩 증가함.
    //한번더 더하고 빌드+더하고 마지막 빌드->+2
    counter += 1;
    setState(() {});
    */
    */
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              /*
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              */
              //★★Collection for 기능★★
              //numbers안의 요소에 각 반복 실행마다 1:1 대응
              for (var n in numbers) Text('$n'),
              //IconButton위젯은 onPressed: 클릭될때 액셜될 지정함수,
              //icon: const Icon(Icons.~~)로 구성+(기타 등등 EX)iconSize)
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
