void main(){
  // Map : key, value로 이루어진 데이터
  // 생성1 : JSON 객체 형식으로 Map 생성
  var map1 = {
    'key1' : "홍길동",
    'key2' : 2,
    'key3' : true
  };
  print(map1);

  /*
   생성2 : Java와 동일하게 타입매개변수를 이용해서 생성.
    하지만 Dart에서는 인스턴스 생성 시 new를 사용하지 않는다.
    new는 묵시적으로 선언된다.
  */
  Map<String, int> map2 = Map();
  map2['홍길동'] = 20;
  map2['전우치'] = 25;
  map2['손오공'] = 30;
  print(map2);

  // 기존의 key가 있으면 수정, 없으면 추가된다.
  map2['멀린'] = 35; // 추가
  map2['홍길동'] = 21; // 수정
  print(map2);

  // Key를 통해 데이터 삭제
  map2.remove('홍길동');
  print(map2);

  /*
    Null Safety(널 세이프티) : 변수를 선언할 때 null값을 허용할지
      여부를 결정한다.
      int? 변수명 : 해당 변수는 null 값을 허용한다.
      int 변수명 : null 값이 입력되면 에러가 발생한다.
      var은 유추형 타입이므로 null이 입력되어도 에러가 발생하지 않는다.
   */
  
  // *** 값 빠르게 찾아오는 것이 목적 ***
  /* null값을 허용하는 변수로 선언되었으므로 문제 없음.
   해당 key는 앞에서 이미 삭제되었음. */
  int? val1 = map2['홍길동'];
  print(val1);

  /* null 값을 허용하지 않는 변수로 선언됨. 따라서 삼항연산자로
   구분해서 값을 입력한다. (null값이면 -1을 넣을게~)*/
  int val2 = map2['홍길동'] ?? -1;
  print(val2);

  /* var는 입력되는 데이터에 따라 타입이 결정되는 유추형이다.
   따라서 null을 입력할 수 있다. */
  var val3 = map2['홍길동'];
  print(val3);
  /* var는 타입이 결정되면 다른 타입으로 변경할 수 없다. 하지만
   앞에서 null이 입력되어 타입이 결정되지 않았으므로 아래와 같이
   데이터를 입력할 수 있다. */
  val3 = 1;
  print(val3);
  
  // 해당 map에 key가 존재하는지 확인
  var bCheck = map2.containsKey('멀린');
  if(bCheck){
    print("멀린은 존재 하는 값 입니다");
  }
  
  // 반복
  print("==================================");
  // Map의 key를 통해 요소를 출력
  for (var key in map2.keys){
    print('$key : ${map2[key]}');
  }
  
  print("==================================");
  // 요소 자체를 인출하여 key와 value를 출력
  for (var e in map2.entries){
    print('${e.key} : ${e.value}');
  }
  print("==================================");

  // 스프레드 연산자(...)
  var map3 = {
    ...map1,
    'key4' : '전우치'
  };
  print(map3);
}