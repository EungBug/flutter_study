// class

class Player {
  // property 정의 시 타입을 꼭 명시해야 함.
  String name = 'Eungbug';
  int xp = 1000;
  // final 키워드로 정의 시 값을 변경할 수 없다.
  final String nickname = 'Eungeung';

  // 함수 정의
  void sayHi () {
    print('Hello, $name, xp is $xp');
  }
}

void main() {
  // Player class의 인스턴스 생성 
  var player = Player();
  print(player.name);
  // property의 값을 변경할 수 있다.
  player.name = 'Eungbug2';
  print(player.name);

  // final로 정의한 property 값을 변경하려고 하면 에러가 발생한다.
  // player.nickname = 'lalalal';
  print(player.nickname);

  // 인스턴스의 함수 호출
  player.sayHi();
}