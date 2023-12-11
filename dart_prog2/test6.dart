void main() {
  // 문자열 보간
  var name = 'EungBug';
  var age = 10;
  
  // 단순하게 변수 값 출력 $변수명
  // 계산식을 적용하려면 ${}안에 작성
  var greeting = 'Hello, My name is $name, I\'m ${age+2}';

  print(greeting);
}