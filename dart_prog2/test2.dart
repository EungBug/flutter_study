void main() {
  // 분기문 : if/else || switch

  // if문 / if-else문
  if (10 < 20) {
    print('True');
  }

  // else문
  bool trigger = 10 > 20;
  if (trigger) {
    print('참');
  } else {
    print('거짓');
  }

  // else if문
  String color = 'red';
  if (color == 'blue') {
    print('파란색 이다');
  } else if (color == 'red') {
    print('빨간색 이다');
  } else {
    print('파란색, 빨간색 둘다 아니다');
  }

  // switch문
  int num = 5;
  switch (num) {
    case 1:
      print('1');
    case 2:
      print('2');
    case 3:
      print('3');
    case 4:
      print('4');
    case 5:
      print('5');
    default:
      print('default');
  }
}
