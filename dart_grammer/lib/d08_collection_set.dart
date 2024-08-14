void main(){

  // Set : 데이터 순서가 없고 중복하용하지 않음.

  // 초기값에 중복이 있으면 자동으로 제거된다;
  // Set<String> set1 = {'c','b','a', 'a'};
  Set<String> set1 = {'c','b','a'};

  // a는 존재하므로 추가되지 않음.
  set1.add('a');
  set1.add('a');
  // 추가됨
  set1.add('d');
  print(set1);

  // 삭제
  set1.remove('c');
  print(set1);

  // *** 값 존재 유무 체크가 목적 ***
  var bCheck = set1.contains('b');
  if(bCheck){
    print("b는 존재하는 값입니다.");
  }

  // 인덱스로 개별 값 접근 (forans)
  for (int i=0; i<set1.length; i++){
    print('set1[${i}] -> ${set1.elementAt(i)}');
  }

  // 확장 for문으로 인덱스 없이 접근
  for (dynamic each in set1){
    print(each);
  }

  // 스프레드 연산자(...)
  var set2 = { ...set1, 'x', 'y', 'z'};
  print(set2);
}