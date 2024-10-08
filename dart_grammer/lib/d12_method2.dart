void main() {
  
  /* Positional parameters : 매개변수의 위치에 따라 갑을 부여한다.
      따라서 순서는 변경할 수 없다. */
  
  // 파라미터를 옵션처리 했으므로 인수가 없어도 호출가능
  something1();
  something1('홍길동');
  
  something2('해리포터');
  something2('멀린', 20);
  something2();
  // 인수의 순서를 변경하면 에러가 발생한다.
  // something2(20, '스트레인지');

  something3('전우치');
  something3('손오공', 20);

  something4('이순신');
  something4('강감찬', 20);
}

/* 파라미터를 옵션처리한다. ?가 있으므로 인수가 없는 경우
  null로 지정된다. */
void something1([String? name]) {
  print('name : $name');
}

/* 2개의 파라미터를 모두 옵션처리 */
void something2([String? name, int? age]) {
  print('name : $name age : $age');
}

/* 필수 + 옵션 */
void something3(String name, [int? age]) {
  print('name : $name age : $age');
}

/* 파라미터의 디폴트값을 지정 */
void something4(String name, [int age = 10]) {
  print('name : $name age : $age');
}