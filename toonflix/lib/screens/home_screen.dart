import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                '25:00',
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
                onPressed: () {},
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
                    ),
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
