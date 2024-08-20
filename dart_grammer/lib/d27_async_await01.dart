// cnt초 대기 후 실행되는 매서드
Future<void> morning(cnt) {
  Future.delayed(Duration(seconds: cnt), () {
    print("$cnt초후 morning함수 호출");
  });
  return Future(() => null);
}

// cnt횟수만큼 반복하는 메서드
Future<void> afternoon(cnt) {
  return Future(() {
    int rNum = 0;
    for(int i=1; i<=cnt; i++) {
      print("afternoon함수 호출 $i");
    }
  });
}

void main() {
  print("main 시작");
  // 5초 후에 실행된다.
  morning(5);
  // 10번 반복 실행된다.
  afternoon(10);
  /*
   morning이 시간이 더 많이 걸리는 작업이므로 대기하지 않고
   afternoon이 먼저 실행된다.
   만약 morning의 실행결과가 뒷 작업에 영향을 미친다면 이 로직은
   논리적 오류가 발생한 것이다.
   */
  print("main 끝");
}