void main(){
  // Dart는 배열이 없다. 리스트로 사용한다.
  // List : 데이터 순서가 있고 중복허용

  /*
   List 컬렉션 생성시 <>안에 사용하는 타입을 명시하여 현재 생성된
   컬렉션에 저장할 데이터의 타입을 지정한다. 즉 타입매개변수를
   사용할 수 있다.
   */
  List<String> list1 = ['a', 'b', 'c', 'a'];
  List<int> list2 = [1,2,3,1];

  // var를 통해서도 리스트를 생성할 수 있다.
  var list3 = ['a', 'b', 'c', 'a'];
  // 리스트의 끝에 데이터 추가
  list3.add('d');
  print(list3);

  // 동일한 데이터가 있다면 앞에 있는 1개만 삭제됨
  list3.remove('a');
  print(list3);

  // 인덱스는 0부터 시작이므로 3번째 요소가 삭제됨.
  list3.removeAt(2);
  print(list3);

  // 일반 for문으로 리스트에 인덱스를 통해 개별적인 접근을 한다.
  for(int i=0; i<list3.length; i++){
    print('list3[${i} -> ${list3[i]}');
  }

  //확장 for문으로 리스트의 크기만큼 자동으로 반복한다.
  for(var each in list3){
    print(each);
  }

  // 스프레드 연산자(...)를 통해 2개의 리스트를 하나로 연결함.
  var list4 = [ ...list2, 5, 6, 7];
  print(list4);
}