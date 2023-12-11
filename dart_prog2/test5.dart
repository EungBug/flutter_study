void main() {
  // List 타입
  // var 키워드로 생성 후 타입추론
  var numbers = [1, 2, 3, 4];
  // List로 타입 명시
  List<int> numbers2 = [1, 2, 3, 4];

  numbers.add(5);

  // collection if
  // 특정 조건에 따라 리스트의 요소를 결정
  var giveMeFive = true;
  var nums = [
    1, 2, 3, 4, if(giveMeFive ) 5
  ];
  print(nums);

  // collection for
  // 리스트 내에서 for문을 사용하여 반복적으로 요소를 추가 가능
  var oldFriends = ['minsoo', 'dara'];
  var newFriends = [
    'mina', 
    'juhee',
    for(var friend in oldFriends) "🌞 $friend"
    ];
    print(newFriends);

}