import 'dart:async';
import 'package:flutter/material.dart';
import 'package:toonflix/shared/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //static const로 선언해서 데이터 변경을 반영
  static const int twentyFiveMinutes = 1500; //25분을 초로 나타내면
  int totalSeconds = twentyFiveMinutes;
  int totalPromodors = 0; //시간이 끝나면 +1
  bool isRunning = false; //실행중일 경우를 위한 변수, (초기상태는 실행x이므로 false)
  //late 지시어: late로 지정하면 나중에 사용하겠다는 의미. 반드시 사용해야함.
  late Timer timer;

//반드시 Timer의 객체를 받아서 사용하게금 함.(밑의 onStartPressed함수의 timer는 t= timer로 초기화 됨.)
  void onlTick(Timer t) {
    //0초가 되면 타이머 종료 후 다시 1500으로 세팅 및 버튼 플레이으로 변경
    if (totalSeconds == 0) {
      t.cancel(); //타이머 종료
      setState(() {
        totalPromodors += 1;
        isRunning = false; //타이머가 종료 됐으므로 버튼모양 변경을 위해 false
        totalSeconds = twentyFiveMinutes;
      });
    } else {
      //★★★★setState를 통해 데이터 변화(state변화) 반영★★★★
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  //시작(play) 버튼 클릭시 작동 메서드
  void onStartPressed() {
    //위의 타이머 객체에다 Timer.periodic() 메소드로 초기화
    timer = Timer.periodic(
      //★★★Duration(시간 단위: 시각)★★★
      const Duration(seconds: 1), //1초마다 실행하겠다.
      onlTick, //"onlTick()"이라 안하고 ()이라고만 한다.
    );
    setState(() {
      isRunning = true;
    });
  }

  //멈춤(pause) 버튼 클릭시 작동 메서드
  void onPausePressed() {
    timer.cancel(); //★★★타이머 객체의 작동을 멈춤 ★★★
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
    timer.cancel(); //리셋한 후에 타이머 취소
  }

//1500초를 받아서 00:00 형식으로 바꾸는 메소드
  String format(int totalSeconds) {
    //★★1500초를 "00:00:00.000000"형식의 객체 형태로 초기화★★
    var duration = Duration(seconds: totalSeconds);
    //★★★객체를 먼저 문자열로 바꾼후 원하는 formating 진행★★★
    print(duration.toString()); // 0:25:00.000000을 문자열로 바꿈
    //┌ ★[0:25:00,000000]★
    print(duration.toString().split(".")); //문자열을 "."을 기준으로 나눈 후 리스트에 넣음.
    print(duration.toString().split(".").first); //리스트의 첫번째 문자열을 선택
    //★★문자열2~7까지만 "substring"함.★★
    print(duration.toString().split(".").first.substring(2, 7));

    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //배경화면은 context의 배경화면을 사용
      backgroundColor: Theme.of(context).colorScheme.background,
      //상단바
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text(
          'Timer',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          )
        ],
      ),
      drawer: const MenuDrawer(),
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
                format(totalSeconds),
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
            flex: 1,
            child: Center(
              //아이콘 버튼에 할당할 메소드+ 속성들 명시
              child: IconButton(
                onPressed: isRunning
                    ? onPausePressed
                    : onStartPressed, //아이콘 클릭시 해당 메소드 실행
                //
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
                iconSize: 120,
                color: Theme.of(context).cardColor, //흰색
              ),
            ),
          ),
          //초기화 버튼
          Flexible(
            flex: 1,
            child: Center(
              //아이콘 버튼에 할당할 메소드+ 속성들 명시
              child: IconButton(
                onPressed: onResetPressed, //아이콘 클릭시 해당 메소드 실행
                //실행중이면 보이게
                icon: const Icon(Icons.restore_outlined),
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
                          '$totalPromodors',
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
