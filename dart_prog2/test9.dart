// 함수
void sayHello(String name) {
  print("Hello $name nice to meet you!");
}

// fat arrow syntax=> 바로 리턴하는 문법
int add(int a, int b) => a + b;

// parameter에는 2가지가 있다.
// 기본적으로 positional parameter와 named parameter
// {} 안에 파라미터를 넣으면 named argument를 지원한다.
// null 문제를 해결하기 위해 default value를 넣어주거나,
// required 키워드를 사용한다.
String sayHi(
    {required String name, required int age, String country = 'Germany'}) {
  return "Hello $name, you are $age, and you come from $country.";
}

void main() {
  sayHello('Eungbug');
  print(add(1, 2));
  // print(sayHi('Eungbug', 10, 'Korea'));
  // 파라미터가 많을 경우 named argument를 사용해서 함수를 호출하는 것이 좋다.
  print(sayHi(name: 'Eungbug', age: 12, country: 'Cuba'));
  print(sayHi(name: 'Bab', age: 90));
}
