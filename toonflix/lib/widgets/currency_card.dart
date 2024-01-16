import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon; //아이콘 데이터 타입
  final bool isInVerted;
  final double order;
  //'_변수'의 의미: 이는 privacy하게 무언가를 설정할때 쓰는 관용어임.
  final Color _blackColor = const Color(0xFF1F2123);
  //생성자
  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.order,
    required this.isInVerted,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.translate(
      offset: Offset(0, -(order * 10)),
      child: Container(
        clipBehavior: Clip.hardEdge, //★container를 넘어간 것들을 처리할때 사용
        decoration: BoxDecoration(
          color: isInVerted ? Colors.white : _blackColor,
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
                  Text(
                    name,
                    style: TextStyle(
                      color: isInVerted ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInVerted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5, //양옆 간격은 width임
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInVerted
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
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
                  child: Icon(
                    icon,
                    color: isInVerted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
