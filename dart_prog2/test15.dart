// Abstract class 추상화 클래스

abstract class Human {
  // 클래스가 가질 메서드를 정의
  void walk();
}

class Player extends Human {
  String name;
  int age;

  Player({required this.name, required this.age});

  // 상속받는 클래스에 정의된 메서드를 정의해야함.
  void walk() {
    print('$name is walk...');
  }
}


void main() {
  var player = Player(name: 'bibi', age: 30);
  player.walk();
}