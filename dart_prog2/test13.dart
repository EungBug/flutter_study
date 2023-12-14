// class 생성자
class Player {
  final String name;
  int xp;

  // 함수 정의
  void sayHi () {
    print('Hello, $name, xp is $xp');
  }

  // 생성자 정의
  Player(this.name, this.xp);

  /* late 키워드를 사용하여 프로퍼티 정의 시 생성자 정의 방법
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }
  */
}

void main() {
  // 생성자를 통한 인스턴스 생성
  var player = Player('Bubu', 2000);
  player.sayHi();

  var player2 = Player('ombomb', 1200);
  player2.sayHi();
}