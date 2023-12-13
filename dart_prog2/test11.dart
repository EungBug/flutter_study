// Typedef : 간단한 data alias를 만들때 사용
typedef ListOfInts = List<int>;

typedef UserInfo = Map<String, String>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
}

void main() {
  print(reverseListOfNumbers([1, 2, 3, 4, 5]));
  print(sayHi({"name": 'John'}));
}
