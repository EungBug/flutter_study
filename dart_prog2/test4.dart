void main() {
  // 예외처리
  // try-catch / finally
  int num = 10;
  try {
    print(num ~/ 0); // IntegerDivisionByZeroException 에러 발생
  } catch(error) {
    print(error);
  } finally {
    // 예외가 발생했던, 안했던 try-catch 이후 실행할 코드
    print('예외처리문이 끝났다.');
  }

  // on 문
  int? num2;
  try {
    // print(num ~/ 0);
    print(num2!);
  } on UnsupportedError catch (e) {
    print('0으로 나눌 수 없습니다.');
  } on TypeError catch (e) {
    print('Null 값이 참조 되었습니다.');
  }

  // throw - 예외를 만들어 던지는 문
  // rethrow - 이미 잡아놓은 예외를 밖으로 내보냄
  try {
    throw Exception('Unknown Error');
  } catch (e) {
    print(e);
    // rethrow;
  }

  print('원래는 에러 발생으로 실행되지 않는 코드');
}