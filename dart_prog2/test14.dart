// Named Constructors Parameters
class Player {
  final String name;
  int xp;
  String team;
  int age;

  // 함수 정의
  void sayHi () {
    print('Hello, $name, xp is $xp');
  }

  // 생성자 정의
  Player({ 
    required this.name, 
    required this.xp,
    required this.team,
    required this.age
  });

}

void main() {
  // Named Constructor를 통한 인스턴스 생성
  var player = Player(name: 'bibi', xp: 1000, team: 'blue', age: 10);
  player.sayHi();

  var player2 = Player(name: 'gongji', xp: 1200, team: 'red', age: 24);
  player2.sayHi();
}