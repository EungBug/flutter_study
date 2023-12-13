// optional positional parameters
// []안에 파라미터를 정의하고 null을 허용해주고 default value를 넣어준다.
String sayHello(String name, int age, [String? country = 'US']) {
  return 'Hello $name, you are $age, you are from $country';
}

// QQ operator ?? / ??=
// 좌항이 null 이면 우항을 반환 left ?? right
String capitalizeName(String? name) => name?.toUpperCase() ?? 'EUNBI';

void main() {
  print(sayHello('Eungbug', 10));
  print(capitalizeName('eungbug'));
  print(capitalizeName(null));

  // ??= 변수가 null 인 경우 우항에 있는 값을 할당
  String? name;
  name ??= 'bibi';
  print(name);
}
