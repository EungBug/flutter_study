void main() {
  // Map
  // key-value 형식으로 이루어진 자료구조
  // key는 중복되지 않고, value는 중복이 가능하다.
  
  // 생성
  // var 키워드로 생성
  var map1 = {
    1: '강아지',
    2: '고양이',
    3: '토끼'
  };
  print(map1.values); // (강아지, 고양이, 토끼)

  // 타입 명시
  Map<int, String> map2 = {
    1: '바나나',
    2: '사과',
    3: '오렌지'
  };
  print(map2); // {1: 바나나, 2: 사과, 3: 오렌지}

  // Map 객체 사용
  var map3 = new Map();
  map3[1] = '빨강';
  map3[2] = '파랑';
  map3[3] = '노랑';
  print(map3.values); // (빨강, 파랑, 노랑)

  // key가 없는 경우 null을 반환
  print(map3[4]); // null
  // key가 있는 경우 key에 해당하는 값을 반환
  print(map3[1]); // 빨강

  // key나 value를 갖고 있는지 확인
  print(map3.containsKey(6)); // false
  print(map3.containsValue('파랑')); // true

  // entries : key-value쌍을 이터러블 객체로 반환
  print(map3.entries); // (MapEntry(1: 빨강), MapEntry(2: 파랑), MapEntry(3: 노랑))

  // .isEmpty : Map이 비어있는지 확인
  // .length : Map의 key-value 쌍이 몇 개인지 반환
  print(map3.isEmpty); // false
  print(map3.length); // 3
}