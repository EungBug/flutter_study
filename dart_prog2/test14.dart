// Named Constructors Parameters
class Player {
  final String name;
  int xp, age;
  String team;

  // 함수 정의
  void sayHi () {
    print('Hello, $name, xp is $xp');
  }

  // 생성자 정의
  // Named parameter를 이용한 생성자
  Player({ 
    required this.name, 
    required this.xp,
    required this.team,
    required this.age
  });

  // Named Constructor 정의
  Player.createBluePlayer({required String name, required int age, }) : 
  // 초기화
  this.age = age, 
  this.name = name, 
  this.team = 'blue',
  this.xp = 0;

  Player.createRedPlayer(String name, int age) :
  this.name = name,
  this.age = age,
  this.team = 'red',
  this.xp = 0;
}

void main() {
  // Constructor를 통한 인스턴스 생성
  var player = Player(name: 'bibi', xp: 1000, team: 'blue', age: 10);
  player.sayHi();

  // cascade operator
  var newPlayer = Player(name: 'rolrol', xp: 1000, team: 'blue', age: 11)
  // ..을 사용하면 변수에 바로 접근이 가능하다.
  ..age = 12
  ..team = 'yellow'
  ..xp = 2000
  ..sayHi();

  // Named Constructor를 통한 인스턴스 생성
  var player2 = Player.createBluePlayer(name: 'gongji', age: 12);
  player2.sayHi();

  var player3 = Player.createRedPlayer('juju', 7);
  player3.sayHi();
}