// mixin : 생성자가 없는 클래스
// 여러 클래스에서 재사용이 가능하다.
mixin Strong {
  final double strengthLevel = 150.99;
}

mixin QuickRunner {
  void runQuick() {
    print('ruuuuuuuuuun!!!');
  }
}

enum Team { red, blue }

// with 키워드를 통해 Mixin 내부의 프로퍼티와 메서드를 가져와서 사용할 수 있다.
class Player with Strong, QuickRunner {
  final Team team;

  Player({required this.team}); 
}

class Horse with Strong, QuickRunner {}


void main() {
  var player = Player(team: Team.red);
  player.runQuick();
  print(player.strengthLevel);

  var horse = Horse();
  horse.runQuick();  
}