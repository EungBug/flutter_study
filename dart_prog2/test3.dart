void main() {
  // 반복문
  // for문
  for (int i = 0; i < 10; i++) {
    print(i);
  }

  // for in문
  List<int> indexs = [0, 1, 2, 3, 4, 5];
  for (final i in indexs) {
    print(i);
  }

  // while문
  int count = 0;
  while (count <= 5) {
    print(count);
    count++;
  }

  // do-while문
  int count2 = 0;
  do {
    if(count2 == 3) {
      continue; // 특정 조건에 맞을 경우 반복문을 종료
    }
    print(count2);
    count2 ++;
  } while (count2 <= 5);
}
