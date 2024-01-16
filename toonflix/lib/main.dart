import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

//flutter의 가장 기초적인 위젯: StatelessWidget
class App extends StatelessWidget {
  const App({super.key});

  @override
  //위젯을 build 모든게 위젯으로 구성됨
  Widget build(BuildContext context) {
    //★ 앱의 root return 타입 2가지: 1.MaterialApp(안드로이드) / 2.CupertinoApp(ios)
    //안에는 각 클래스의 생성자에 넣을 파라미터인데, named parameter이다.
    return MaterialApp(
      //Scaffold: 화면의 구성 및 구조에 관한 것
      home: Scaffold(
        //전체 앱 배경화면 변경
        backgroundColor: const Color(0xff181818), //custom 컬러(16진법:0xFF)
        //SingleChildScrollView는 앱화면을 스크롤 할 수 있게 만듦.
        body: SingleChildScrollView(
          child: Padding(
            //padding: EdgeInsets.all(10),//전체 10만큼 padding
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ), //수평 방향(왼,오)40padding
            child: Column(
              //위에서 아래 방향으로 쌓는거(Column)
              //맨 위 상단바(첫번째 자식(안의 두개의 세로 방향 텍스트))
              crossAxisAlignment:
                  CrossAxisAlignment.start, //기본 값을 시작점으로(원래는 가운데임)
              //시작점은 많은 아이들을 가진다(so, children)
              children: [
                //빈공간 만들기
                const SizedBox(
                  //단위는 모두px단위인다.
                  height: 80,
                ),
                const Row(
                  //현재 메인 정렬 방향: 수평(row)
                  mainAxisAlignment:
                      MainAxisAlignment.end, //현재 메인방향(수평)의 맨 끝으로 정렬
                  children: [
                    Column(
                      //현재 메인 정렬 방향: 수직(column)
                      crossAxisAlignment:
                          CrossAxisAlignment.end, //현재 메인의 "반대" 방향(수평)의 맨 끝으로 정렬
                      children: [
                        Text(
                          'Hey, Chanuk',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                          //bold 및 텍스트 굵기-> fontWeight, 나머지는 fontstyle에서 가능(ex: 기울임꼴).
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            //Opacity는 불투명한 정도(즉, 1이면 완전 불투명)
                            color: Color.fromRGBO(255, 255, 255, 1),
                            //위 코드와 완전 동일->color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ), //여기까진 수평방향 한 단락
                const SizedBox(
                  height: 70,
                ),
                //2번째 수평 요소
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$5 194 482',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 42,
                    fontWeight: FontWeight.w600, //글자 굵기 커스텀
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //3번째 수평 요소
                const Row(
                  //2개의 요소가 최대한 떨어진 상태(MainAxisAlignment.spaceBetween)
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //두개의 요소 필요(child가 아님)
                  children: [
                    //커스텀한 Button class를 메소드로 사용함.(생성자에 named parameters를 이용해 값 입력)
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFFF2B33A),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: "Request",
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                //4번째 수평요소
                const SizedBox(
                  height: 60,
                ),
                Row(
                  //2개의 요소가 최대한 떨어진 상태(MainAxisAlignment.spaceBetween)
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //둘다 세로 방향 밑으로 정렬
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //2개의 요소 필요
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                //5번째 수평요소(card 만들기)
                const SizedBox(
                  height: 10,
                ),
                //사용자 지정 Widget 사용x
                Container(
                  clipBehavior: Clip.hardEdge, //★container를 넘어간 것들을 처리할때 사용
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F2123),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //첫번째 아이는 Column이다.(euro, 6428, EUR을 위한)
                      children: [
                        Column(
                          //수평방향으로 모두 같이 시작
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Euro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  '6 428',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5, //양옆 간격은 width임
                                ),
                                Text(
                                  'EUR',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //두번째 아이는 Icon이다.
                        //하지만 icon의 크기를 키우면 container box도 커진다.
                        //★★★★★★★★★
                        //따라서 Transform.scale(scale:x ,child: Icon)를 통해서
                        //상위 child의 크기는 고정시키고, 아이콘 크기만 키우게 할수 있다.
                        Transform.scale(
                          scale: 2.2,
                          //Transform.translate은 원래 위치에서 이동, offset(dx,dy)만큼
                          child: Transform.translate(
                            offset: const Offset(-5, 12),
                            child: const Icon(
                              Icons.euro_rounded,
                              color: Colors.white,
                              size: 88,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //사용자 지정 Widget 사용O

                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  order: 4,
                  icon: Icons.currency_bitcoin,
                  isInVerted: true,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '428',
                  order: 8,
                  icon: Icons.attach_money_outlined, //dollar 아이콘은 money임
                  isInVerted: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
