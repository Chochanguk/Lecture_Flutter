import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500; //25분
  //late 지시어: late로 지정하면 나중에 사용하겠다는 의미. 반드시 사용해야함.
  late Timer timer;
  //위의 타이머 변수를 받아서 사용
  void onlTick(Timer timer) {
    //★★★★setState를 통해 데이터 변화(state변화) 반영★★★★
    setState(() {
      totalSeconds -= 1;
    });
  }

  //아이콘 버튼 클릭하면
  void onStartPressed() {
    //
    Timer.periodic(
      //★★★Duration(시간 단위: 시각)★★★
      const Duration(seconds: 1), //1초마다 실행하겠다.
      onlTick, //"onlTick()"이라 안하고 ()이라고만 한다.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //배경화면은 context의 배경화면을 사용
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //★★★Flexible은 UI를 비율에 기반해서 더 유연하게 만들어 준다.★★★
          //multiple screen 제작 가능(ios,android 화면에 맞게 만들어줌)
          Flexible(
            flex: 1, //이건 기본값
            child: Container(
              //★★★위치를 한 flexible안의 한 container의 바닥 가운데로 "(위치)할당"★★★
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            /*이건 한부분의 박스에만 파랑색으로 칠함
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),*/
          ),
          //중앙에 "플레이 아이콘 버튼 생성"
          Flexible(
            flex: 2,
            child: Center(
              //아이콘 버튼에 할당할 메소드+ 속성들 명시
              child: IconButton(
                onPressed: onStartPressed, //아이콘 클릭시 해당 메소드 실행
                icon: const Icon(Icons.play_circle_outline),
                iconSize: 120,
                color: Theme.of(context).cardColor, //흰색
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                //★★Expaded 위젯은 "ROW"일때 양옆으로 확장시켜줌★★
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        //★★★★null이면 기본값 제공 함 따라서 "!" 불필요 .Theme.of(context)
                        color: Theme.of(context).cardColor,
                        //container를 각이 안지게 하는법 boxdeco의 borderradius사용
                        //★★BorderRadius.only★★사용-> (왼쪽or 오른쪽)+ 위, 설정가능
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Promodors',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                //★★★★"!"은 null일때 기본값 제공x, 따라서 null이 아님을 확신하다는 의미이다.
                                //★★★★★ Theme.of(context) 까진 null이면 기본값 제공이라 "!" 필요x
                                Theme.of(context).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
