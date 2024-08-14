void main(){
  // dart는 더블과 싱글쿼테이션을 구분하지 않는다.
  print('Hello');
  print("Hello");

  // 문자열에서 변수를 출력할 때는 $를 이용하면 된다.
  int num = 1;
  print(num);
  print('num의 값은 $num');

  // 수식의 경우에는 브레이스괄호(중괄호)를 사용하면 된다.
  print('1 + 2 = ${1 +2}');
}