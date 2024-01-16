import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  //★★클래스 생성★★
  //1. StatelessWidget를 상속 받는다
  //2. Widget build 생성 (안에는 "return 내가 원하는 widget")
  //3. 버튼 클래스의 특성에 맞는 클래스변수 생성후, 생성자 생성
  //4. 각 특성에 맞게 임의값을 생성자가 세팅하면(입력 받으면),
  //그 값을 build안의 위젯에 변수 할당 및 위젯(메소드) 생성

  //버튼클래스의 기능을 위한 변수(특성을 선언)
  final String text;
  final Color bgColor;
  final Color textColor;
  //생성자
  const Button(
      {super.key, //
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //container는 html의 div같은 거다. 별건 없다
    return Container(
      decoration: BoxDecoration(
        color: bgColor, //★입력 배경화면
        borderRadius: BorderRadius.circular(45), //둥근 모양
      ),
      //이 경우엔 임의의 값이므로 const하면 안됨.
      child: Padding(
        //이 경우엔 padding 할 값을 지정 했으니 ㄱㅊ
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 45,
        ),
        child: Text(
          text, //★입력 텍스트
          style: TextStyle(
            color: textColor, //★입력 컬러
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
